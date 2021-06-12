public class Accountcontroller1 {

    public string AccountName{get;set;}
    public string AccountFax{get;set;}
    public string AccountIndustry{get;set;}

    public pageReference saveAccount(){
     Account ac = new Account();
     ac.Name = AccountName;
     ac.Fax = AccountFax;
     ac.Industry = AccountIndustry;
     insert ac;
     return new pageReference('/' +ac.Id);


}

}