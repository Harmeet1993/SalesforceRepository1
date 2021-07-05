public class AccountRestApi {

    public list<account> acclist{get; set;}


    public void getaccounts(){
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setMethod('GET');
    req.setEndpoint('https://ap15.salesforce.com/services/apexrest/AccountApi');
    req.setHeader('Content-Type', 'application/json; charset=UTF-8');
    req.setHeader('Accept', 'application/json');
    req.setHeader('Authorization', 'Bearer 00D3h000003wqCy!AQkAQHF0BVJ1D1hvDKAXhk50U69CyfF2BRXrRKSsNjPbumfSGQTRrFOBiXwZtFaY52CEZf6oorY8eImOEr5qZhrruSaCz.MM');
    HttpResponse res = h.send(req);
    list <Account> acclist = (list <Account>) JSON.deserialize(res.getBody(), list<Account>.class);
    system.debug('Accounts fetched are ' +acclist); 
    
       list<account> accountoinsert = new list<Account>();
        for(Account ac : acclist){
         Account acct = new Account();
         acct.Name = ac.Name;
         acct.Fax = ac.Fax;
         acct.AccountNumber = ac.AccountNumber;
         accountoinsert.add(acct);
         }

         insert accountoinsert;
}
}