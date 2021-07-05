public class ContactVf3Controller {

    public string AccName{get;set;}
    public string AccPhone{get;set;}
    public string AccFax{get;set;}

    public ContactVf3Controller(){

   }
  
    public PageReference SaveAcc(){
     Account acc = new Account();
     acc.Name = AccName;
     acc.Phone = AccPhone;
     acc.Fax = AccFax;
     insert acc;
     return new PageReference('/' +acc.Id);
   

 

    }
    

 }