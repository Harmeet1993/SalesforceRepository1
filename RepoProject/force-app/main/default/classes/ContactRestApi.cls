public class ContactRestApi {

   //private final string clientId ='3MVG9Kip4IKAZQEUWtEf94M8K1xSDm9gjK93YzIYFL21EDSXPZaE2GowMR581fXy3rKTYX7FgJuUSeOx0R3dL';
  // private final string clientSecret='B3E73AAAE8C409441CEFC1BBDA51AACC004BF6DD4BE82A65761F4CA3D08F3F75';

 
      public class DeserializeResponse{
      public string access_token;

    }

    public list<contact> conlist{get;set;}
    
    public string accesstoken{get;set;}
   
     public ContactRestApi(){
     conlist = new list<contact>();
    }

    public string getaccesstoken(){

    list<Test_objects__c> obj = Test_Objects__c.getall().values();
    system.debug('Values are' +obj);
   // DeserializeResponse accesstoken = new DeserializeResponse();
    //if(!obj.isEmpty()){
     string clientId = obj[0].Client_Id__c;
     string clientSecret = obj[0].Client_secret__c;
     system.debug('Client ID ' +clientId);
     system.debug('ClientSecret' +clientSecret);
     String reqbody = 'grant_type=password&client_id=' + clientId + '&client_secret=' + clientSecret + '&username={!$Credential.Username}'  + 
            '&password={!$Credential.Password}';
     
     Http h = new Http();
     HttpRequest req = new HttpRequest();
     req.setBody(reqbody);
     req.setMethod('POST');
     req.setEndpoint('callout:Account_Named_Credential');
     HttpResponse res = h.send(req);
     
    // system.debug('Response is ' +res.getBody());
     DeserializeResponse accesstoken = (DeserializeResponse) JSON.deserialize(res.getBody(), DeserializeResponse.class);
     
     system.debug('Access Token is' +accesstoken.access_token);
     return accesstoken.access_token;
     //system.debug('Access Token is' +accesstoken.access_token);
    
    }

    public pageReference getcontacts(){

    string token;
    token = getaccesstoken();
    system.debug('Token parsed is' +token);
    Http h1 = new Http();
    HttpRequest req1 = new HttpRequest();
    req1.setMethod('GET');
    req1.setHeader('Authorization','Bearer ' + token);
    req1.setHeader('Content-Type','application/json');
    req1.setHeader('accept','application/json');
    req1.setEndpoint('https://ap15.salesforce.com/services/apexrest/ContactApi');
    //req1.setEndpoint('https://login.salesforce.com/services/apexrest/ContactApi');
    HttpResponse res1 = h1.send(req1);
    String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
    system.debug('Response is trimmed' +trimmedResponse);
    list<Contact> contactlist = (list<Contact>) JSON.deserialize(trimmedResponse, list<contact>.class);
    conlist = contactlist;
    system.debug('COntacts are' +conlist);
    return null;

}




}