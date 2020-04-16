@isTest
public class AddPrimaryContactTest {
        @testSetup
        static void setup() {
        //nsert 50 Account records for BillingState "NY" and 50 Account records for BillingState "CA".
	  	List<Account> accounts = new List<Account>();
        for(Integer i=0; i < 50; i++) {
   			accounts.add(new Account(Name='Test Account '+ (i*2), BillingState='NY'));         
   			accounts.add(new Account(Name='Test Account '+ (i*2+1), BillingState='CA'));         
        }
        insert accounts;
    }
    
    static testmethod void testExecute() {
        AddPrimaryContact accUpdater = new AddPrimaryContact(new Contact(FirstName = 'Primary Contact', LastName= 'X'), 'CA');
        Test.startTest();
        System.enqueueJob(accUpdater);
        Test.stopTest();
        List<Account> accounts = [select id, (select id, FirstName, LastName from Contacts) from Account where BillingState = 'CA'];
        for(Account acc : accounts) {
                System.assertEquals(true, acc.contacts[0].FirstName == 'Primary Contact' && acc.contacts[0].LastName == 'X' );
        }
    }
}