trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Opportunity> opp = [SELECT
                        Id,StageName from Opportunity where 
                        Id IN : Trigger.new];
    List<Task> taskList = new List<Task>();
    for(Opportunity o : opp){
        if(o.StageName=='Closed Won'){
         	taskList.add(new Task(Subject='Follow up Test Task',
                                 WhatId = o.Id));   
        }
    }	
    if(!taskList.isEmpty()){
        insert tasklist;
    }
}