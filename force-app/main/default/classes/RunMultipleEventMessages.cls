public class RunMultipleEventMessages {
    public static void RunMultipleEventMessages() {
        List<Cloud_News__e> newsEventList = new List<Cloud_News__e>();
        Cloud_News__e event1 = new Cloud_News__e(Location__c = 'Mountain City', Urgent__c = true, News_Content__c = 'Lake Road is closed due to mudslides.');
        Cloud_News__e event2 = new Cloud_News__e(Location__c = 'Mountain City', Urgent__c = false, News_Content__c = 'Small incident on goat cross the road');

        newsEventList.add(event1);
        newsEventList.add(event2);

        List<Database.SaveResult> results = Eventbus.publish(newsEventList);

        for(Database.SaveResult sr:results) {
            if(sr.isSuccess()) {
                System.debug('Successfully published events');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('Error returned: ' +
                                    err.getStatusCode() +  
                                    '-' +
                                    err.getMessage());
                }
            }
        }
    }
}
