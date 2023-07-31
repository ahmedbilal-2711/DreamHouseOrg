public with sharing class SendEmailClass {
    public SendEmailClass() {

    }

    public static void sendEmailMethod(List<Contact> listOfConts) {
            List<Messaging.Email> listEmail = new List<Messaging.Email>();
            for (Contact con : listOfConts) {
                if (con.Email!=null) {   
                    Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                    String[] email = new String[]{con.Email};
                    String subject = 'Welcome ' + con.FirstName;
                    String body = 'Hi ' + con.FirstName + '<br/>' + 'Welcome to salesforce!';
                    emailMsg.setToAddresses(email);
                    emailMsg.setSubject(subject);
                    emailMsg.setHtmlBody(body);
                    listEmail.add(emailMsg);
                }
            }
            Messaging.sendEmail(listEmail);
    }
}