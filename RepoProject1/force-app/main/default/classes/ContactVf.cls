public class ContactVf {

    public list<contact> conlist{get;set;}
    public list<contact> contlist{get;set;}

   //  public ContactVf() {
     // conlist = new list<contact>();
      //contlist = new list<contact>();
     //}


    public void getold(){
     conlist = [select id, FirstName, Email, Phone from contact order by createddate asc limit 10];
     

}

    public pageReference getnew(){
     contlist = [select id, FirstName, Email, Phone from contact order by createdDate desc limit 10];
      return null;
}
}