@isTest 
public with sharing class TestRestrictContactByName {
    public static List<Contact> lstContacts = new List<Contact>(); 
    @isTest public static void insertContacts() {
        lstContacts.add(new Contact(LastName = 'Ahmed'));
        lstContacts.add(new Contact(FirstName = 'Ahmed 1',LastName = 'INVALIDNAME',email = 'test@test.com'));
        insert lstContacts;
    }
}   