@isTest
public class TestSubscribeCloudNewsEvent {
    public TestSubscribeCloudNewsEvent() {

    }
    @isTest
    static void test1() {
        Cloud_News__e newsEvent = new Cloud_News__e(
            Location__c = 'Mountain City',
            Urgent__c = true,
            News_Content__c = 'Test Message'
        );
        Test.startTest();
        Database.SaveResult sr = Eventbus.publish(newsEvent);
        Test.stopTest();
        System.assertEquals(true, sr.isSuccess());
        List<Case> cases = [select id from Case];
        System.assertEquals(1, cases.size());
    }
}
