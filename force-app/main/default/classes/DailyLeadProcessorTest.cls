@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 200; i++) {
            leads.add(new Lead(Company = 'test lead '+i, LastName = 'last Name'));
        }
        insert leads;
    }
    
    static testmethod void testDailyLeadProcessor() {
        Map<Id, Lead> mapLeads = new Map<Id, Lead>([select id from Lead where Name like 'test lead%']);
        List<Id> listIds = new List<Id>(mapLeads.keySet());
        Test.startTest();
        System.schedule('Update lead source', CRON_EXP, new DailyLeadProcessor());
        System.assertEquals(0, [select count() from lead where Company = 'test lead%' and leadSource = 'Dreamforce']);
        Test.stopTest();
        System.assertEquals(listIds.size(), [select count() from lead where Name = 'test lead%' and leadSource = 'Dreamforce']);
    }

}