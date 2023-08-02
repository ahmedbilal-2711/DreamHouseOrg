public with sharing class restrictDuplicateContacts {
    public restrictDuplicateContacts() {

    }

    // Senario
    // Write a trigger on contact to prevent duplicate records based on Contact Email & Contact Phone.

    public static void noDuplicate(List<Contact> listContacts){
        List<String> newEmail = new List<String>();
        List<String> newPhone = new List<String>();
        List<String> oldEmail = new List<String>();
        List<String> oldPhone = new List<String>();
        for (Contact con : listContacts) {
            if (con.Email!=null) {
                newEmail.add(con.Email);
            }
            newPhone.add(con.Phone);
        }
        // List<Contact> oldContacts = new List<Contact>{[SELECT Email FROM Contact WHERE Email IN :newEmail OR Phone IN :newPhone]};
        for (Contact con : [SELECT Email FROM Contact WHERE Email IN :newEmail OR Phone IN :newPhone]) {
            oldEmail.add(con.Email);
            oldPhone.add(con.Phone);
        }
        String statement;
        for (Contact con : listContacts) {
            if (oldEmail.contains(con.Email)||oldPhone.contains(con.Phone)) {
                con.addError('Duplicate email or phone number found!');
            }else{
                continue;
            }
        }
    }
}