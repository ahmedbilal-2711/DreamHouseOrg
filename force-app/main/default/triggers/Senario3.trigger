trigger Senario3 on SOBJECT (before delete) {
    if (trigger.isDelete && trigger.isBefore) {
        Senario3.checkOwnerOnDelete(trigger.new);
    }
}