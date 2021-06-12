public class ScheduleableClass implements Schedulable {

   public Integer fail_size = 0;
   public Integer success_size = 0;

    public void execute(SchedulableContext sc){
    list<Account> acclist = [Select id, Name, Phone from Account];
        for(Account acc : acclist){
            if(acc.Phone == null){
             acc.Phone = '9123106440';
             }
        }

     Database.SaveResult[] result = Database.update(acclist, false);
     Integer result_size = result.size();
        for(Integer i=0; i<result_size; i++){
         Database.SaveResult res = result.get(i);
            if(res.isSuccess()){
             success_size += 1;
             system.debug('No of Records Updated' +success_size);
            } else{
              fail_size += 1;
               system.debug('No of Records failed' +success_size);
            }
 
        }
     
    }
}