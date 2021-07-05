trigger AccountOpportunityTrigger on Account (before update, after update) {

if(Trigger.isUpdate){
     
     if(Trigger.isBefore){

        AccOppHandler.updatePhone(Trigger.new, Trigger.oldMap);

     }else if(Trigger.isAfter){

        AccOppHandler.updateRelatedOpp(Trigger.new, Trigger.oldMap);
     }
  
    }

}