trigger AccountTrigger1 on Account (before insert, before update, after insert, after update) {

    if(Trigger.isInsert){
        if(Trigger.isBefore){
         AccountTriggerHandler.updateRating(trigger.new);
        } else if(Trigger.isAfter){
          AccountTriggerHandler.createRelatedOpp(Trigger.new);
        } 

    }

    if(Trigger.isUpdate){
        if(Trigger.isBefore){
        AccountTriggerHandler.updatePhoneDescription(Trigger.new, Trigger.oldMap);
        } else if(Trigger.isAfter){
          AccountTriggerHandler.updateRelatedOppPhone(Trigger.new, Trigger.oldMap);
       }

   }

}