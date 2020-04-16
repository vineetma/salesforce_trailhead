global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext sc) {
        List<Lead> leads = [select Id from Lead where LeadSource = '' limit 200];
        for(Lead lead : leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}