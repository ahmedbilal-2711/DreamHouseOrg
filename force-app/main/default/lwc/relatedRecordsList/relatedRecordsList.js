import { LightningElement, wire, api, track } from 'lwc';
// import { getRecord } from 'lightning/uiRecordApi';
import fetchRelatedRecordsList from '@salesforce/apex/fetchRelatedRecordsList.getRelatedContacts';
import updateContacts from '@salesforce/apex/UpdateTabelContents.updateContacts';
// import Contact from '@salesforce/schema/Contact.AccountId';
// import { notifyRecordUpdateAvailable } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import { refreshApex } from '@salesforce/apex';
const columns = [
    {label:'Name',fieldName:'Name'},
    {label:'Email',fieldName:'Email', editable : 'True'}
];

export default class RelatedRecordsDisplay extends LightningElement {
    @api recordId;
    @track relatedContacts = [];
    updatedContacts = [];
    columns = columns;
    @wire(fetchRelatedRecordsList, { accountId: '$recordId' })
    wiredContacts({error,data}){
        if (data) {
            console.log(data);
            this.relatedContacts = data;
        }else if (error){
            console.log(error);
        }
    }


    async handleSave(event) {
        const updatedFields = event.detail.draftValues;
        try {
            const result = await updateContacts({data: updatedFields});
            console.log(JSON.stringify("Apex update result: "+ result));
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Contact updated',
                    variant: 'success'
                })
            );
             this.draftValues = [];
             document.location.reload(true)
            } catch(error) {
               this.dispatchEvent(
                   new ShowToastEvent({
                       title: 'Error updating or refreshing records',
                       message: error.body.message,
                       variant: 'error'
                    })
                    // this.ShowToast()
             );}
    }

    ShowToast(title, message, variant, mode){
        const evt = new ShowToastEvent({
                title: title,
                message:message,
                variant: variant,
                mode: mode
            });
            this.dispatchEvent(evt);
    }
    async refresh() {
        await refreshApex(this.wiredContacts);
    }
}
