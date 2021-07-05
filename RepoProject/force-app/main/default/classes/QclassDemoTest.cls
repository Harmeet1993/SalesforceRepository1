@isTest
public with sharing class QclassDemoTest {
    
@isTest
public static void QclassTest(){
Account acc = new Account(Name='Test', phone='92475240');
insert acc;

Test.startTest();
Id batchId = system.enqueuejob(new QclassDemo(acc));
Test.stopTest();

 list<Account> acclist = [select id, Name, Phone from Account where Id = :acc.Id];
   system.assertEquals('Ram', acc.Name);
   system.assertEquals('952745640', acc.phone);


}


}