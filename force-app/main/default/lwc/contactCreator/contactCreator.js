import { LightningElement } from 'lwc';
import Contact from '@salesforce/schema/Contact';
import FirstName from '@salesforce/schema/Contact.FirstName';
import LastName from '@salesforce/schema/Contact.LastName';
import Email from '@salesforce/schema/Contact.Email';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
const fields = [FirstName,LastName,Email];
export default class ContactCreator extends LightningElement {
    objectApiName = Contact;
    fields = fields;

    handleSuccess(event){
    this.dispatchEvent( new ShowToastEvent({ title: 'Success',message: `Contact is created ${event.detail.id} !`,variant: 'success' }))
    }
    errorHandler(){
    this.dispatchEvent( new ShowToastEvent({ title: 'Error',message: 'Contact creation failed !',variant: 'error' }))
    }
}