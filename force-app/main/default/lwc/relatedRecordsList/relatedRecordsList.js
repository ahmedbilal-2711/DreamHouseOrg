import { LightningElement, api, wire, track } from 'lwc';
// import { getRecord } from 'lightning/uiRecordApi';
import fetchRelatedRecordsList from '@salesforce/apex/fetchRelatedRecordsList.getRelatedContacts';
import updateRecords from '@salesforce/apex/UpdateTable.updateRecords';
import Contact from '@salesforce/schema/Contact.AccountId';
// import { updateRecord } from 'lightning/uiRecordApi';
// import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { refreshApex } from '@salesforce/apex';
const columns = [
    {label:'Name',fieldName:'Name', editable : 'True'},
    {label:'Email',fieldName:'Email', editable : 'True'},
];

export default class RelatedRecordsDisplay extends LightningElement {
    @api recordId;
    @track relatedContacts = [];
    updatedContacts = [];
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

    handleSave(event){
        console.log(event.detail.draftValues);
        updateRecords({accountData:event.detail.draftValues}).then(result=>{
            console.log(JSON.stringify(result));
        }).catch(error=>{
            console.log(JSON.stringify(error));
        })
        // this.updatedContacts = event.detail.draftValues;
        // const inputItems = this.updatedContacts.slice().map(draft =>{
        //     const fields = Object.assign({},draft);
        //     return fields;
        // });
        // const promises = inputItems.map(recordInp =>updateRecord(recordInp));
        // Promise.all(promises).then(res =>{
        //     console.log('Response is: ' + res);
        //     this.dispatchEvent(new ShowToastEvent({ title:'Success', message:'Record updated successfully', variant:'success' }));
        //     this.updatedContacts = [];
        //     return this.refresh();
        // }).catch(error => {
        //     console.log('Error is: ' + error);
        //     this.dispatchEvent(new ShowToastEvent({ title:'Error', message:'Error occured while updating', variant:'error' }));
        // })
    }
    
    async refresh(){
        await refreshApex(this.relatedContacts);
    }
}
