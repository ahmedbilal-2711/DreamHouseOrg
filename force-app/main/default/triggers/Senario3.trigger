trigger Senario3 on Task (before delete) {
    if (trigger.isDelete && trigger.isBefore) {
        Senario3.checkOwnerOnDelete(trigger.new);
    }
}