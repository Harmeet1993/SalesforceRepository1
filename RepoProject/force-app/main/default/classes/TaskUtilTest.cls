@isTest
public class TaskUtilTest {


    @isTest static void testpriority(){
      string pri = TaskUtil.getpriority('CA');
      system.assertEquals('Normal', pri);
 
 }

    @isTest static void testprioritys(){
    string pri = TaskUtil.getpriority('NY');
    system.assertEquals('High', pri);
 
}
    @isTest static void testpriorityss(){
    string pri = TaskUtil.getpriority('');
    system.assertEquals(Null, pri);
}

}