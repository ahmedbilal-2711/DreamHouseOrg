import { LightningElement, wire, track } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
const columns = [
    {label:'First Name',fieldName:'FirstName'},
    {label:'Last Name',fieldName:'LastName'},
    {label:'Email',fieldName:'Email'}
]
export default class ContactList extends LightningElement {
    @track contacts = [];
    columns = columns;
    @wire(getContacts)
    wiredContacts({error,data}){
        if (data) {
            console.log("testting"+data);
            this.contacts = data    
        }else{
            console.log(error);
        }
    }
}