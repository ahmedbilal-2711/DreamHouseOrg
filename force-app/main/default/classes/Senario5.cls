public with sharing class Senario5 {
    public Senario5() {

    }
    public static void createOpportunityLineItem(List<Opportunity> listOpportunity){
        String setProductId = [SELECT Id FROM Product2 WHERE Name='Lenovo T540p' LIMIT 1].id;
        system.debug('');
        List<OpportunityLineItem> listOpportunityLineItem = new List<OpportunityLineItem>();
        for (Opportunity opp : listOpportunity) {
            OpportunityLineItem oli = new OpportunityLineItem();
            oli.OpportunityId=opp.id;
            oli.Product2Id=setProductId;
            oli.Quantity=40;
            oli.TotalPrice=500;
            listOpportunityLineItem.add(oli);
        }
        system.debug('listOpportunityLineItem: ' + listOpportunityLineItem);
        if (!listOpportunityLineItem.isEmpty()) {
            
            insert listOpportunityLineItem;
        }
    }
}