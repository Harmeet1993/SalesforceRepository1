trigger AccountDelete on Account (before delete) {

    if(Trigger.isBefore && Trigger.isDelete){
         AccountDeleteHandler.PreventDeletion(Trigger.old, Trigger.oldMap);
    }
 

}