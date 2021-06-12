public class TaskUtil {


    public static string getpriority(string leadstate){
        if(string.isBlank(leadstate)){
         return null;
     
}

   string taskpriority;
    
        if(leadstate == 'NY'){
         taskpriority = 'High';
  
      }

        else {
              taskpriority = 'Normal';
}

     return taskpriority;
}

}