@isTest
private class TestVerifyDate {
    @isTest static void testWithIn30days(){
        Date date1 = Date.newInstance(2023, 8, 7);
        Date date2 = Date.newInstance(2023, 9, 7);
        VerifyDate.CheckDates(date1,date2);
    }
    
    private testmethod static void testNotWithIn30days(){
        Test.startTest();
        Date date1 = Date.newInstance(2023, 8, 7);
        Date date2 = Date.newInstance(2023, 9, 4);
        VerifyDate.CheckDates(date1,date2);
        Test.stopTest();
    }
}