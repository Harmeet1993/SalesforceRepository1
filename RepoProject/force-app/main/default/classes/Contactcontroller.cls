public class Contactcontroller {

    public list<contact> conlist{get;set;}
    public list<contact> contlist{get;set;}
    public Contactcontroller(){
      conlist = new list <Contact>();
      conlist = [select Id, FirstName, Email, Phone from Contact limit 10];

    }
    public pageReference getcontacts(){
     contlist = [select Id, FirstName, Email, Phone from Contact order by createdDate desc limit 5];
     return null;

}



}