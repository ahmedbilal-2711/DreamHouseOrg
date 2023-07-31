public class AccountHandler {
    public static Account insertNewAccount(String NameOfAcc){
        Account account = new Account(Name=NameOfAcc, Phone='(415)555-1212',
                                     NumberOfEmployees=100);
        try{
            insert account;
            return account;
        }catch(DmlException e){
             System.debug('A DML exception has occurred: ' +
                e.getMessage());
            return null;
        }
    }
    
    public Void insertAccount(Integer num){
        List<Account> addAccounts = new List<Account>();
        while(num>0){
            Account a = new Account();
            a.AccountNumber='A000'+ String.valueOf(num);
            a.Name='Acme Inc '+String.valueOf(num)	;
            addAccounts.add(a);
            num--;
        }
        insert addAccounts;
    }
}