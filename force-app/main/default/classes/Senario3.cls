public with sharing class Senario3 {
    public Senario3() {

    }
    public static void checkOwnerOnDelete(List<Task> tasksList) {
        Id ids = [SELECT Id from Profile WHERE Name='System Administrator'].id;
        for (Task task : tasksList) {
            if (UserInfo.getUserId() != ids) {
                task.addError('Delete permission not assigned!');
            }else{
                continue;
            }
        }
    }
}           