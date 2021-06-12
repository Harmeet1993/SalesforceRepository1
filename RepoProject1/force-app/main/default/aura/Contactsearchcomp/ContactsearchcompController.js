({
	doSearch : function(component, event, helper) {
    var name = component.get('v.conName');
    var action = component.get('c.getcontacts');
    action.setParams({str : name});	
    action.setCallback(this, function(response){
    var state = response.getState();
    if(state === 'SUCCESS'){
   // alert('Success');
   // var value = response.getReturnValue();
    component.set("v.Contactlist", response.getReturnValue());
    console.log('Value is' +component.get("v.Contactlist"));

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
  },'SUCCESS');

  $A.enqueueAction(action);

	
	},

    doRedirect : function(component, event, helper){
    var eventsource = event.getSource();
    var id= eventsource.get('v.name');
    var navEvt = $A.get("e.force:navigateToSObject");
    navEvt.setParams({
      "recordId": id,
      "slideDevName": "related"
    });
    navEvt.fire();

  },

})