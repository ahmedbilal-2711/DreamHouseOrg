public class ContactAndLeadSearch {
    
    public static List<List<sObject>> searchContactsAndLeads(String namePart){
        return [FIND :namePart IN NAME FIELDS RETURNING Contact,Lead];
    }
    
}