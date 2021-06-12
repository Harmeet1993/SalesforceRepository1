public class ApiPostalCode {

      public string pincode{get;set;}
      public string pinmessage{get;set;}
      public list <PincodeResponse.PostofficeDetails> presp{get;set;}

       public void getpincode(){
       Http h = new Http();
       HttpRequest req = new HttpRequest();
       req.setMethod('GET');
       req.setEndpoint('https://api.postalpincode.in/pincode/411033');
       HttpResponse res = h.send(req);
       system.debug('Response is' +res.getBody());
       list<PincodeResponse> pincode = (list<PincodeResponse>) JSON.deserialize(res.getBody(), list <PincodeResponse>.class);
       pinmessage = pincode[0].Message;
       presp = pincode[0].PostOffice;
       system.debug('Parsed is' +pinmessage);
       

}}