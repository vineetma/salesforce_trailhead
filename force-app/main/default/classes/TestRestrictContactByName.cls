@isTest
public class TestRestrictContactByName {
    @isTest
    public static void TestRestrictContactByName() {
//        Contact con = new Contact(FirstName = 'Vineet', LastName = 'Maheshwari');
//        insert con;
        Contact con2 = new Contact(FirstName = 'Testing', LastName = 'INVALIDNAME');
 
        Test.startTest();
        Database.SaveResult result = Database.insert(con2, false);
        Test.stopTest();

        System.Debug('Message: ' + result.getErrors()[0].getMessage());
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML', 
            result.getErrors()[0].getMessage());
    }

    @isTest
    public static void TestRestrictContactByNameWithValidName() {
        Contact con1 = new Contact(FirstName = 'Vineet', LastName = 'Maheshwari');
        Test.startTest();
        Database.SaveResult result = Database.insert(con1, false);
        Test.stopTest();

        System.assert(result.isSuccess());
    }
}
