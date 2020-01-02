trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert) {
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('maheshwari.vineet@gmail.com', 'TrailHead trigger tutorial', recordCount + ' contact(s) were inserted');
    } else if(Trigger.isDelete) {

    }
}