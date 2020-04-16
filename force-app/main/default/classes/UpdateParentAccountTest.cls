@isTest
public class UpdateParentAccountTest {
	@testSetup
    static void setup() {
        List<Account>accounts = new List<Account>();
        accounts.add(new Account(Name='Parent'));
        for(Integer i = 0; i < 100; i++) {
            accounts.add(new Account(Name = 'Test Account'+ i));
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        Id parentId = [select id from Account where name = 'Parent'][0].Id;
        List<Account> accounts = [select id from Account where name like 'Test Account%'];
        System.debug('Accounts found: ' + accounts.size() + ', Id: ' + parentId);
        UpdateParentAccount updater = new UpdateParentAccount(accounts, parentId);
        Test.startTest();
        System.enqueueJob(updater);	
        Test.stopTest();
        System.assertEquals(100, [select count() from account where parentId=:parentId]);
    }
}