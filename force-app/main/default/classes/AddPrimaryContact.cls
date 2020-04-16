public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String billingState;
    public AddPrimaryContact(Contact con, String billingState) {
        this.contact = con;
        this.billingState = billingState;
        return;
    }
    
    public void execute(QueueableContext qc) {
       List<Account> accounts = [select Id from Account where billingState = :this.billingState limit 200]; 
       List<Contact> contacts = new List<Contact>();
        for(Account account : accounts) {
            Contact con = contact.clone();
            con.AccountId = account.Id;
            contacts.add(con);
        }
        insert contacts;
    }
}