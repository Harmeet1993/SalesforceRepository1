public class InsertChildAccount {

  private final string clientId ='3MVG9Kip4IKAZQEUWtEf94M8K1xSDm9gjK93YzIYFL21EDSXPZaE2GowMR581fXy3rKTYX7FgJuUSeOx0R3dL';
   private final string clientSecret='B3E73AAAE8C409441CEFC1BBDA51AACC004BF6DD4BE82A65761F4CA3D08F3F75';
    private final string username = 'tylerrake2020@altok.com';
     private final string password = 'Yuvraj2021' + 'WIGJV81vZ2Sxh0SKPRkBjvM2';

  public class deserializeResponse {
      public String access_token;
}

    public list<Account> acclist{get;set;}

     public InsertChildAccount(){
      acclist = new list<account>();
        }

    

    public string getaccesstoken(){
     String reqbody = 'grant_type=password&client_id=' + clientId + '&client_secret=' + clientSecret + '&username=' + username + 
                      '&password=' + password;
    Http h = new Http();
    HttpRequest req = new HttpRequest();
    req.setBody(reqbody);
    req.setMethod('POST');
    req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
    HttpResponse res = h.send(req);
  //  system.debug('Response is' +res.getBody());
    deserializeResponse response = (deserializeResponse) JSON.deserialize(res.getBody(), deserializeResponse.class);
    return response.access_token;
    //system.debug('JSON Parsed' + response.access_token);


}

    public pageReference getContact(){
     string access_token;
     access_token = getaccesstoken();  
     system.debug('Response is' +access_token);
    // String endPoint2 = 'https://ap15.salesforce.com/services/apexrest/AccountApi';
     string endPoint2 = 'https://tylerrake-dev-ed.my.force.com/services/apexrest/AccountApi';
     Http h2 = new Http();
     HttpRequest req2 = new HttpRequest();
     req2.setHeader('Authorization','Bearer ' + access_token);
     req2.setHeader('Content-Type','application/json');
     req2.setHeader('accept','application/json');
     req2.setMethod('GET');
     req2.setEndpoint(endPoint2);
     HttpResponse res1 = h2.send(req2);
     String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
     list<Account> Accountlist = (list<Account>) JSON.deserialize(trimmedResponse, list<Account>.class);
     acclist = Accountlist;
     system.debug('Accounts fetched are' +acclist);
     return null;
}

}