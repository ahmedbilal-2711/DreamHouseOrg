public with sharing class Senario4 {
    public Senario4() {

    }
    public static void autofillAccShipAdd(List<Account> listAccounts) {
        for (Account acc : listAccounts) {
            acc.ShippingCity = acc.BillingCity; 
			acc.ShippingCountry = acc.BillingCountry;
			acc.ShippingPostalCode = acc.BillingPostalCode;
			acc.ShippingState = acc.BillingState;
			acc.ShippingStreet = acc.BillingStreet;
        }
    }
}