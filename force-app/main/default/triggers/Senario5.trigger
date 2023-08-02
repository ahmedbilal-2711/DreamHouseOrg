trigger Senario5 on Opportunity (after insert) {
    if (trigger.isAfter && trigger.isInsert){
        Senario5.createOpportunityLineItem(trigger.new);
    }
}