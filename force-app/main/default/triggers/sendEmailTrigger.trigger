trigger sendEmailTrigger on Contact (after insert) {
    if(trigger.isInsert){
    SendEmailClass.sendEmailMethod(trigger.new);    
    }
    
}