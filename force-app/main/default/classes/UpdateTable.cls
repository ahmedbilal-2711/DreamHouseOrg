public with sharing class UpdateTable {
    public UpdateTable() {

    }
    @AuraEnabled
    public static String updateRecords(List<Account> accountData) {
        System.debug(accountData);
        // List<Account> lstAccount = (List<Account>) JSON.deserialize(JSON.serialize(accountData), List<Account>.class);
        if (!accountData.isEmpty()) {
            update accountData;
            return 'Success';
        }
        return 'Failed';
    }
}   