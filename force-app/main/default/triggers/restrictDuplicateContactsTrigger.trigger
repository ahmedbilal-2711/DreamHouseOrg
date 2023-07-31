trigger restrictDuplicateContactsTrigger on SOBJECT (before insert, before update) {
    if (trigger.before) {
        restrictDuplicateContacts.noDuplicate(trigger.new);
    }
}