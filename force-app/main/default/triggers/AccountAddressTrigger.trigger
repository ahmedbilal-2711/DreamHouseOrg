trigger AccountAddressTrigger on Account (before insert, before update) {
	
    if(trigger.isBefore){
        List<Account> LstAccounts = new List<Account>();
        if(trigger.isInsert || trigger.isUpdate){
            
            for(Account acc : Trigger.new){
                if(acc.Match_Billing_Address__c == true){
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                    LstAccounts.add(acc);
                }
                
            }    
        } 
        if(!LstAccounts.isEmpty()){
            Update LstAccounts;
        }
        
    }
    
}