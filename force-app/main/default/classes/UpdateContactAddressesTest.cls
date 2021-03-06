@IsTest
public class UpdateContactAddressesTest {
	@testSetup
    static void setup() {
     	List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        
        for(Integer i=0; i < 10; i++) {
            accounts.add(new Account(name='Account ' + i, billingCity = 'New York', billingCountry='USA'));
        }
        insert accounts;
        
        for(Account account : [select id from account]) {
            contacts.add(new Contact(firstname = 'first', lastname = 'last', accountId=account.id));
        }
        insert contacts;
    }
    
    static testmethod void test() {
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
        System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);
    }
    
}