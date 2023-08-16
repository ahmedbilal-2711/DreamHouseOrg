public with sharing class fetchRelatedRecordsList {
    public fetchRelatedRecordsList() {

    }
    
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(String accountId) {
        return [SELECT Id, Name, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }

}

