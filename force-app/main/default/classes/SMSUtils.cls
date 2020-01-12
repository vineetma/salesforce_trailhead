// This code does not work
public class SMSUtils {
    @future(callout=true)
    public static void sendSMSAsync(String fromNbr, String toNbr, String m) {
        String results = sendSMS(fromNbr, toNbr, m);
        System.debug(results);
    }

    public static string sendSMS(String fromNbr, String toNbr, String m) {
        String results = SmsMessage.send(fromNbr, toNbr, m);
        insert new SMS_Log__c(to_c=toNbr, from_c=fromNbr, msg_C=results);
        return results;
    }
}