trigger ContextExampleTrigger on Account (before insert, after insert, after delete) {
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            System.debug('I will process is before insert here');
        } else if(Trigger.isAfter) {
            System.debug('I will process is after insert here');
        }
    } else if(Trigger.isDelete) {
            System.debug('I will process is before/after delete here');
    }
}