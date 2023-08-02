trigger testFile on ContentVersion (after insert) {
    if(Trigger.IsInsert && Trigger.IsAfter){
        testFile.doAfterInsert(Trigger.New);
    }
}