public with sharing class UpdateTabelContents {
    public UpdateTabelContents() {

    }
    @AuraEnabled
    public static string updateContacts(Object data) {
        List<Contact> contactsForUpdate = (List<Contact>) JSON.deserialize(
             JSON.serialize(data),
             List<Contact>.class
        );
        System.debug(contactsForUpdate);
        try {
            update contactsForUpdate;
            System.debug('After update'+contactsForUpdate);
            return 'Success: contacts updated successfully';
        }
        catch (Exception e) {
            return 'The following exception has occurred: ' + e.getMessage();
        }
    }
}