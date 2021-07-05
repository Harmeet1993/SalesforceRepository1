({
	 doInit : function(component, event, helper) {
		component.set('v.columns', [
            {label: 'FirstName', fieldName: 'FirstName', type: 'text'},
            {label: 'LastName', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'email'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'}
            ]);                     
      
      var action = component.get('c.getcontacts');
       action.setCallback(this, function(response){
        var state = response.getState();
        if(state === 'SUCCESS'){
        // alert('Success');
       // var value = response.getReturnValue();
       component.set("v.data", response.getReturnValue());
       console.log('Value is' +component.get("v.data")); 
        }
       });
      $A.enqueueAction(action);
	}

})