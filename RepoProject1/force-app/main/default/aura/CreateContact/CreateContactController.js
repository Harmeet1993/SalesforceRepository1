({
	dosave : function(component, event, helper) {
    var action = component.get('c.createcontact');
        action.setParams({con : component.get('v.CreateContact')});
        console.log('Contacts', component.get('v.CreateContact'));
        action.setCallback(this, function(response){
        var state = response.getState();
       // alert(state); 
            if(state === 'SUCCESS'){
            //alert('Record Saved to Contact');
             var responsevalue = response.getReturnValue();
             console.log('Response Value', responsevalue);
            }
           else if(state === 'ERROR'){
        var errors = response.getError();
        if(errors){
        if(errors[0] && errors[0].message){
        console.log('Error Message' +errors[0].message);
        }
        else {
        console.log('Unknown error');
         
        }
      }
     }
    });
	$A.enqueueAction(action);	
	}
})