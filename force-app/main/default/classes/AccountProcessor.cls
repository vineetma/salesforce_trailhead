public class AccountProcessor {
   @future(callout = true)
    public static void countContacts(List<ID> accIds) {
        List<Account> accounts = [select id from Account where Id in :accIds];
        System.debug('Accounts count: ' + accounts.size() + accounts[0].Id);
        for(Account acc: accounts) {
            System.debug('Id: ' + acc.Id);
            List<Contact> con = [select Id from Contact where Account.Id = :acc.Id];
            System.debug('Count of contacts: ' + con.size());
            acc.Number_of_Contacts__c = con.size();
        }
        update accounts;
    }
}