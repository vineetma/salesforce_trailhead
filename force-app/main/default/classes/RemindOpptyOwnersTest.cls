@IsTest
private class RemindOpptyOwnersTest {

    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @testSetup
    static void setup() {
        List<Opportunity> opptys = new List<Opportunity>();
        Date closeDate = Date.today().addDays(-7);
        for(Integer i=0; i < 10; i++) {
            Opportunity o = new Opportunity(
            	Name = 'Opportunity ' + i,
            	CloseDate = closeDate,
            	StageName = 'Prospecting');
            opptys.add(o);
        }
        insert opptys;        
    }
    static testMethod void testScheduledJob() {
        Map<Id, Opportunity> opptyMap = new Map<Id, Opportunity>([select Id from Opportunity where Name like 'Opportunity%']);
        List<Id> opptyIds = new List<Id>(opptyMap.keySet());
        
        Test.startTest();
        
       	String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new RemindOpptyOwners());
        
        List<Task> listOfTasks = [Select id from Task where WhatId in :opptyIds];
        
        System.assertEquals(0, listOfTasks.size(), 'Tasks exist before job has run');
        
        Test.stopTest();
        
        // Now test should have executed
        listOfTasks = [select id from Task where WhatId in :opptyIds];
        System.assertEquals(opptyIds.size(), listOfTasks.size());
        
    }
}