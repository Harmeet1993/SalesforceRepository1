trigger ContactTrigger on Contact (before insert, before update) {

    for(contact con : Trigger.new){
        if(con.Email == null){
           con.adderror('Email cannot be null');
        }

    }

}