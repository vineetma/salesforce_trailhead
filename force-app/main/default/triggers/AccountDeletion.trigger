trigger AccountDeletion on Account (before delete) {
    for (Account a : [Select id from Account
            where id in (select accountId from Opportunity)
            and Id in :Trigger.old]) {
                Trigger.oldMap.get(a.Id).addError(
                    'Cannot delete account with related opportunities'
                );
    }
}