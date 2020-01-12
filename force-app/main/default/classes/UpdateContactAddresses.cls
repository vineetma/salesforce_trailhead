global class UpdateContactAddresses implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
        'select id, BillingStreet, BillingCity, BillingState, ' +
        'BillingPostalCode, (select Id, MailingStreet, MailingCity, ' +
        'MailingState, MailingPostalCode from Contacts) from Account ' +
        'where BillingCountry = \'USA\''
        );
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        List<Contact> contacts = new List<Contact>();
            System.debug('Account contacts' + scope[0].Contacts.size());
        for(Account account : scope) {
            for(Contact contact : account.Contacts ) {
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                contacts.add(contact);
                recordsProcessed = recordsProcessed + 1;
            }
        }
        update contacts;
    }
    
    global void finish(Database.BatchableContext bc) {
        System.debug(recordsProcessed + ' records processed. Shazam');
        AsyncApexJob job = [Select id, status, numberOfErrors, JobItemsProcessed, TotalJobItems, CreatedBy.Email from AsyncApexJob where Id = :bc.getJobId()];
        EmailUtils.sendMessage(job, recordsProcessed);
    }
}