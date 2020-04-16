public class RunSingleEventMessage {
    public static void RunSingleEventMessage() {
        Cloud_News__e newsEvent = new Cloud_News__e(
            Location__c = 'Mountain City',
            Urgent__c = true,
             News_Content__c = 'Lake Road is closed due to mudslides');
    
        Database.SaveResult sr = EventBus.publish(newsEvent);
        
        if(sr.isSuccess()) {
            System.debug('Successfully published event');
        } else {
            for (Database.Error err : sr.getErrors()) {
                System.debug('Error returned: ' +
                            err.getStatusCode() +
                            err.getMessage());
            }
        }
    }
}
