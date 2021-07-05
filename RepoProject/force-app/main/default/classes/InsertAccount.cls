public class InsertAccount {

   private final string clientid = '3MVG9Kip4IKAZQEUWtEf94M8K1xSDm9gjK93YzIYFL21EDSXPZaE2GowMR581fXy3rKTYX7FgJuUSeOx0R3dL';
   private final string clientsecret= 'B3E73AAAE8C409441CEFC1BBDA51AACC004BF6DD4BE82A65761F4CA3D08F3F75'; 
   string username = 'tylerrake2020@altok.com';
   string password = 'Yuvraj2021' + 'WIGJV81vZ2Sxh0SKPRkBjvM2'; 
    public list<account> acclist{get; set;}
   
    
      public string getaccesstoken(){

        String reqbody = 'grant_type=password&client_id=' + clientId + '&client_secret=' + clientSecret + '&username=' + username + 
                         '&password=' + password;

    String accesstoken_url = 'https://login.salesforce.com/services/oauth2/token';
   
    Http h = new Http();
    HttpRequest req1 = new HttpRequest();
    req1.setBody(reqbody);
    req1.setMethod('POST');
    req1.setEndpoint(accesstoken_url);
    HttpResponse res = h.send(req1);
    System.debug(res.getBody() + '**********');
    DeserailizeResponse response = (DeserailizeResponse) JSON.deserialize(res.getBody(), DeserailizeResponse.class);
    system.debug('Response is' +response);
    return response.access_token;    

 
 }

    public PageReference getaccount(){
    string accesstoken = getaccesstoken();
    if(accesstoken != null){
     string endpoint = 'https://login.salesforce.com/services/apexrest/AccountApi';
     Http h2 = new Http();
     HttpRequest request = new HttpRequest();
     request.setHeader('Authorization', 'Bearer' +accesstoken);
     request.setHeader('Content-Type', 'application/json');
     request.setMethod('GET');
     request.setEndpoint(endpoint);
     Httpresponse resp = h2.send(request);
     string trimmedresponse = resp.getBody().unescapeCsv().remove('\\');
     system.debug('Response Received is' +trimmedresponse);
     acclist = (list<account>) JSON.deserialize(trimmedresponse, list<account>.class);
      }

    return null;


}

}