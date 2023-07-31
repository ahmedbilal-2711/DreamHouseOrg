trigger restrictDuplicateContactsTrigger on Contact (before insert, before update) {
    if (trigger.isBefore) {
        restrictDuplicateContacts.noDuplicate(trigger.new);
    }
}