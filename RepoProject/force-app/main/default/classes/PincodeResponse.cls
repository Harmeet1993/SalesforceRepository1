public class PincodeResponse {

 public string Message;
 public string status;
 public list<PostofficeDetails> PostOffice;

    public class PostofficeDetails{
        public string Name{get;set;}
        public string Region{get;set;}
        public string Block{get;set;}


}

}