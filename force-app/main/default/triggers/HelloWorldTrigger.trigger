trigger HelloWorldTrigger on Account (before insert, before update) {
    System.debug('Hello World');
    for(Account a : Trigger.New) {
        a.Description = 'New Description';
    }
}