public with sharing class RandomContactFactory {
    public RandomContactFactory() {

    }
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lName) {
        List<Contact> lstContacts = new List<Contact>();
        for (Integer i = 1; i <= numOfContacts; i++) {
            lstContacts.add(new Contact(FirstName = 'Test '+i, LastName = 'LNAME'));
        }
        // if (!lstContacts.isEmpty()) {
        //     insert lstContacts;
        // }
        return lstContacts;
    }

}