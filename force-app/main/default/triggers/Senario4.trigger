trigger Senario4 on Account (before insert) {
    if (trigger.isInsert) {
        Senario4.autofillAccShipAdd(trigger.new);
    }
}