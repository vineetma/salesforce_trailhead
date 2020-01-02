trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();

/*    Map<Id, Opportunity> oppsWithTasks = new Map<Id, Opportunity>(
                [select Id, (select Id from Tasks) 
                from Opportunity 
                where Id in :Trigger.New]);*/
                
    for(Opportunity opp : Trigger.New) {
        if(opp.StageName == 'Closed Won') {
            Task t = new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id);
            tasks.add(t);
        }
    }
    if(tasks.size() > 0) {
        insert tasks;
    }
}