public with sharing class restrictDuplicateContacts {
    public restrictDuplicateContacts() {

    }
    public static void noDuplicate(List<Contact> listContacts){
        Set<String> newEmail = new Set<String>();
        Set<String> newPhone = new Set<String>();
        for (Contact con : listContacts) {
            newEmail.add(con.Email);
            newPhone.add(con.Phone);
        }
        Set<Contact> oldEmails = new Set<Contact>{[SELECT Email FROM Contact WHERE Email IN :newEmail]};
        Set<Contact> oldPhone = new Set<Contact>{[SELECT Phone FROM Contact WHERE Phone IN :newPhone]};
        for (Contact con : oldEmails) {
            if (newEmail.contains(con.Email) || newPhone.contains(con.Phone)) {
                System.debug('Lol');
            }
        }
    }
}