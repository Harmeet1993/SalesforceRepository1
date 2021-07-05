public with sharing class QclassDemo implements system.Queueable {

    public Account acc;

    public QclassDemo(Account acct) {
        this.acc = acct;
    }


    public void execute(QueueableContext Qc){

      this.acc.Name = 'Ram';
      this.acc.Phone = '952745640';
       update this.acc;

        QclassDemo1 qcd = new QclassDemo1(this.acc.Id);
        if(!Test.isrunningTest()){
            Id batchId = system.enqueuejob(qcd);
            System.debug('BatchId is ' +'' +batchId);

        }
       
        


    }
}