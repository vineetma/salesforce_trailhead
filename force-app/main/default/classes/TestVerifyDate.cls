@isTest
public class TestVerifyDate {

    @isTest
    static void testSetEndOfMonthDate() {
        Date date1 = Date.newInstance(2019, 12, 15);
        VerifyDate.SetEndOfMonthDate(date1);
    }

    @isTest
    static void testDateWithin30Days_WhenDate2IsLessThanDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2019, 12, 15);
        System.assertEquals(true, VerifyDate.DateWithin30Days(date1, date2));
    }
    @isTest
    static void testDateWithin30Days_WhenDate2IsGreaterThanDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2019, 12, 15);
        System.assertEquals(false, VerifyDate.DateWithin30Days(date1, date2));
    }
    @isTest
    static void testDateWithin30Days_WhenDate2IsEqualToDate1Plus31Days() {
        Date date1 = Date.newInstance(2019, 12, 1);
        Date date2 = Date.newInstance(2020, 01, 01);
        System.assertEquals(false, VerifyDate.DateWithin30Days(date1, date2));
    }

}