@isTest
public with sharing class TestOrderEventTrigger {
    public TestOrderEventTrigger() {

    }
    @isTest
    public static void testOrderEventTrigger(){
        List<Order_Event__e> events = new List<Order_Event__e>();
        Order_Event__e event = new Order_Event__e(
            Has_Shipped__c = true,
            Order_Number__c = '123456'
        );
        events.add(event);
        event = new Order_Event__e(
            Has_Shipped__c = false,
            Order_Number__c = '999988'
        );
        events.add(event);
        Test.startTest();
        List<Database.SaveResult> sr = Eventbus.publish(events);
        Test.stopTest();
        for(Database.SaveResult res : sr) {
            System.assertEquals(true, res.isSuccess());
        }
        List<Task> tasks = [select id from Task];
        System.assertEquals(1, tasks.size());
        
       
    }
}
