trigger AccountTrg1 on Account (before insert, after insert) {

    if(Trigger.isInsert){
        if(Trigger.isBefore){
         AccountTrg1Handler.onBeforeInsert(Trigger.new);
     
        } else if(Trigger.isAfter){
           AccountTrg1Handler.onAfterInsert(Trigger.new);
        
        }

   

   }


}