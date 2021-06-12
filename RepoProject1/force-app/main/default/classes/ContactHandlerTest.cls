@isTest
public class ContactHandlerTest {


    @Testsetup static void CreateData(){
    Contact con = new contact();
    con.FirstName = 'John';
    con.LastName = 'Faulk';
    con.LeadSource = 'Web';
    insert con;
    }

    @isTest static void createCasetest(){
     contact cont = [SELECT Id, LastName from Contact Where Name = 'John Faulk'];
     cont.LastName = 'Faulkner';
     Test.startTest();
     update cont;    
     Test.stopTest();
     Case cs = [SELECT Id from Case Where ContactId = : cont.Id];
     system.assert(cs.id != null);


}
  
    @isTest static void PreventDeletetest(){
     contact con = [SELECT Id, Name from Contact where Name = 'John Faulk'];
     Database.DeleteResult result = Database.delete(con, false);
     system.assertEquals('Contact cannot be deleted', result.getErrors()[0].getMessage());

}
 
}