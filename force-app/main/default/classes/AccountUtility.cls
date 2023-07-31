public class AccountUtility {
    public static Void viewAnnualRevenue(){
        List<Account> accountsList = new List<Account>();
        accountsList = [Select Name,AnnualRevenue FROM Account];
        String acctRev;
        for(Account acc : accountsList){
            acctRev = acc.Name + ' : ' +acc.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}