trigger ContactTrg on Contact (before delete, After Update) {

    if(Trigger.isUpdate && Trigger.isAfter){
     ContactHandler.CreateCase(Trigger.newMap, Trigger.oldMap);
}

    if(Trigger.isDelete && Trigger.isBefore){
     ContactHandler.PreventDelete(Trigger.old);
}

}