public class AccountStandardController {

    public Account acc{get;set;}

     public AccountStandardController(){
      acc = new Account();
}

    public pageReference SaveAccount(){
    insert acc;
    return new pageReference('/' +acc.Id);


}

}