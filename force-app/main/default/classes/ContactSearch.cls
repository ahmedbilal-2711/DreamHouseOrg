public class ContactSearch {
    public static List<Contact> searchForContacts(String lName, String postCode){
        List<Contact> l = new List<Contact>();
        l.addAll([Select Id,Name from Contact where LastName =: lName AND
                 MailingPostalCode=: postCode]);
        return l;
    }
}