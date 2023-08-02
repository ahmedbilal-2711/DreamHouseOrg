public with sharing class Senario4 {
    public Senario4() {

    }

    // Senario
    // Write a trigger on Account , when an account insert , 
    // automatically account billing address should populate into the account shipping address.

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