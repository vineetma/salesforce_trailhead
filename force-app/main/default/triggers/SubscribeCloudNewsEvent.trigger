trigger SubscribeCloudNewsEvent on Cloud_News__e (after insert) {
    List<Case> cases = new List<Case>();
    Group queue = [select id from Group where name = 'Regional Dispatch' and Type = 'Queue'];

    for (Cloud_News__e event : Trigger.New) {
        if(event.Urgent__c == true) {
            Case cs = new Case();
            cs.Priority = 'High';
            cs.Subject = 'News team dispatch to ' +
                        event.Location__c;
            cs.OwnerId = queue.Id;
            cases.add(cs);            
        }
    }
    insert cases;
}