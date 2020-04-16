global class RemindOpptyOwners implements Schedulable {
    global void execute(SchedulableContext sc) {
        List<Opportunity> opptys = [select id, Name, OwnerId, CloseDate
                                   from Opportunity
                                   where IsClosed = False
                                   and CloseDate < TODAY];
        System.debug('Remind owners to be called here.. Executed.');
		List<Task> taskList = new List<Task>();
        for(Opportunity opp : opptys) {
            Task task = new Task(WhatId = opp.Id, OwnerId = opp.OwnerId, ActivityDate = Date.today(), Subject='Update Opportunity', Description = 'Kindly close the ticket by the end of the day');
            taskList.add(task);
        }
        insert taskList;
    }
}