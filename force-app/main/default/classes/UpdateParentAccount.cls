public class UpdateParentAccount implements Queueable {
    private List<Account> accounts;
    private ID parent;
    
    public UpdateParentAccount(List<Account> accounts, ID parent) {
    	this.accounts = accounts;
        this.parent = parent;
    }
    public void execute(QueueableContext qc) {
        for(Account account : this.accounts) {
            account.parentId = this.parent;
        }
        update accounts;
    }
}