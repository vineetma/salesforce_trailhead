@isTest
private class AccountProcessorTest {
    @isTest 
    static void testContactsCount() {
        Test.startTest();
		List<Account> accs = new List<Account>();
        accs.add(new Account(Name = 'Test 1 account'));
		accs.add(new Account(Name = 'Test 2 account'));
    	insert accs;
        List<Contact> cons = new List<Contact>();
        cons.add(new Contact(FirstName = 'Test Name FN 1', LastName = 'Test Name LN 1', AccountId = accs[0].Id));
        cons.add(new Contact(FirstName = 'Test Name FN 2', LastName = 'Test Name LN 2', AccountId = accs[0].Id));
        cons.add(new Contact(FirstName = 'Test Name FN 3', LastName = 'Test Name LN 2', AccountId = accs[1].Id));
        cons.add(new Contact(FirstName = 'Test Name FN 4', LastName = 'Test Name LN 2', AccountId = accs[1].Id));
        insert cons;
        
        List<ID> ids = new List<ID>();
        for(Account acc : accs) {
            ids.add(acc.Id);
        }
        
        AccountProcessor.countContacts(ids);
        
        Test.stopTest();
        // validate if the number of contacts field is updated
        Account acc = [select Number_Of_Contacts__c from Account where Account.Id = :ids[0]];
        System.assertEquals(2, acc.Number_of_Contacts__c);
    }
}