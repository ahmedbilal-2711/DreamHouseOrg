public with sharing class restrictDuplicateContacts {
    public restrictDuplicateContacts() {

    }
    Set<String> newEmail = new Set<String>();
    Set<String> newPhone = new Set<String>();
    public static void noDuplicate(List<Contact> listContacts){
        for (Contact con : listContacts) {
            newEmail.add(con.Email);
            newPhone.add(con.Phone);
        }
        Set<String> oldEmails = new Set<String>{[SELECT Email FROM Contact WHERE Email IN :newEmail]};
        Set<String> oldPhone = new Set<String>{[SELECT Phone FROM Contact WHERE Phone IN :newPhone]};
        for (Contact con : oldEmails) {
            if (newEmail.contains(con.Email) || newPhone.contains(con.Phone)) {
                trigger.addError('Duplicate Email or Phone found!');
            }
        }
    }
}