public class RandomContactFactory {
    public RandomContactFactory() {

    }
    public static List<Contact> generateRandomContacts(Integer numCons, String ln) {
        List<Contact> cons = new List<Contact>();

        for(Integer i = 0; i < numCons; i ++) {
            Contact con = new Contact(FirstName = 'Test' + i, LastName = ln);
            cons.add(con);
        }
        return cons;
    }
}
