@isTest
public class TestVerifyDate {

    @isTest
    static void testCheckDates_WhenDate2IsLessThanDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2019, 12, 15);
        System.assertEquals(Date.newInstance(2019,12,15), VerifyDate.CheckDates(date1, date2));
    }
    @isTest
    static void testCheckDates_WhenDate2IsGreaterThanDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2020, 1, 5);
        System.assertEquals(Date.newInstance(2019,12,31), VerifyDate.CheckDates(date1, date2));
    }
    @isTest
    static void testCheckDates_WhenDate2IsEqualToDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2020, 01, 01);
        System.assertEquals(Date.newInstance(2019,12,31), VerifyDate.CheckDates(date1, date2));
    }

}