trigger OpportunityTrigger on Opportunity (after insert, after update, after delete) {

    if(Trigger.isAfter){

        if(Trigger.isInsert){
             opportunityTriggerHandler.onAfterInsert(Trigger.new);
        } else if(Trigger.isUpdate){
             opportunityTriggerHandler.OnAfterUpdate(Trigger.new, Trigger.oldMap);
        } else if(Trigger.isDelete){
             opportunityTriggerHandler.OnAfterDelete(Trigger.old);
        }

   }


}