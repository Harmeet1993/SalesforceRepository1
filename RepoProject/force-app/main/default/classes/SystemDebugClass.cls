public with sharing class SystemDebugClass {

   
    
  public list<Account> getaccount(){

    list<Account> acclist = [select id, name, phone from Account limit 10];

    return acclist;


    }
}