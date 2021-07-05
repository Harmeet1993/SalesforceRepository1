public class ExceptionUtil {

    public static void LogException(String objName, string processName, string recordId, string exdetails){
        Exception__c e = new Exception__c();
        e.Name = processName;
        e.Object_Name__c = objName;
        e.Exception_Details__c = exdetails;
        insert e;


    }

}