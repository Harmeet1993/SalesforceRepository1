public with sharing class QclassDemo1 implements system.Queueable{
   
    public Id parentId;

    public QclassDemo1(Id accId) {
         this.parentId = accId;

    }

   public void execute(QueueableContext Qc){
      Contact con = new Contact();
      con.FirstName = 'Akshay';
      con.lastName = 'Kumar';
      con.AccountId = this.parentId;
      insert con;

   }

}