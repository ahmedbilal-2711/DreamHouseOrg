import { LightningElement, api, wire } from 'lwc';
// import { getRecord } from 'lightning/uiRecordApi';
import fetchRelatedRecordsList from '@salesforce/apex/fetchRelatedRecordsList.getRelatedContacts';
import Contact from '@salesforce/schema/Contact.AccountId';

const columns = [
    {label:'Name',fieldName:'Name'},
    {label:'Email',fieldName:'Email'},
];

export default class RelatedRecordsDisplay extends LightningElement {
    @api recordId;
    relatedContacts = [];
    columns = columns;
    @wire(fetchRelatedRecordsList, { accountId: '$recordId' })
    wiredContacts({error,data}){
        if (data) {
            this.relatedContacts = data;
        }else if (error){
            // System.debug(error);
        }
    }
    get relatedRecords() {
        return this.Account.data.fields[Contact.AccountId].value;
    }
}
