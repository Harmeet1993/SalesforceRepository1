@isTest
public class COntactVf3ContollerTest {

    public static testMethod void SaveAccTest(){

     Account accobj = AccTestDataFactory.CreateAccount();
      Test.startTest();
       ContactVf3Controller cf = new ContactVf3Controller();
        cf.AccName = accobj.Name;
        cf.AccPhone = accobj.Phone;
        cf.AccFax = accobj.Fax;
        cf.SaveAcc();
      Test.stopTest();
      Account acct = [select Id, Name, Phone, Fax from Account where Name='Test'];
      system.assert(acct.Id != null);
  
   }


}