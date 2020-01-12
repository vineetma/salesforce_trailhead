@isTest
public class LeadProcessorTest {

    @testSetup
    static void setup() {
    	List<Lead> leads = new List<Lead>();
        for(Integer i = 0; i < 10; i++) {
            leads.add(new Lead(FirstName='Lead Test FN ' + i, LastName='Lead Test LN', Company='Test Company '+i));
        }
        insert leads;
    }
    
    static testmethod void testLeadProcessor() {
    	Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        System.assertEquals(10, [select count() from Lead where LeadSource='Dreamforce']);
    }
}