global class LeadProcessor implements 
	Database.Batchable<sObject>, Database.Stateful {
        global Integer recordsProcessed = 0;
        global Database.QueryLocator start(Database.BatchableContext bc) {
            return Database.getQueryLocator('select id, LeadSource from Lead');
        }
        global void execute(Database.BatchableContext bc, List<Lead> scope) {
        	List<Lead> leads = new List<Lead>();
            for(Lead lead : scope) {
                lead.LeadSource = 'Dreamforce';
                leads.add(lead);
            }
            update leads;
            recordsProcessed += scope.size();
        }
        global void finish(Database.BatchableContext bc ) {
            System.debug(recordsProcessed + ' records procssed.');
            AsyncApexJob job = [select id, status, NumberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email from AsyncApexJob where id=:bc.getJobId()];
            EmailUtils.sendMessage(job, recordsProcessed);
        }
}