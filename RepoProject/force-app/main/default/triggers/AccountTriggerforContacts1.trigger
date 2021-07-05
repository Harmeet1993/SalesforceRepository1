trigger AccountTriggerforContacts1 on Account (after insert, after update) {

    if(Trigger.isAfter){
        if(Trigger.isInsert){
           AccountTriggerHandlerContacts.onAfterInsert(Trigger.new);
        } else if(Trigger.isUpdate){
           AccountTriggerHandlerContacts.OnAfterUpdate(Trigger.new, Trigger.oldMap);
            
        }
 
   }
}