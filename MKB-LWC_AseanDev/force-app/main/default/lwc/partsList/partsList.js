import { publish, MessageContext } from 'lightning/messageService';
import { LightningElement, api, wire } from 'lwc';
import PART_LIST_UPDATE_MESSAGE from '@salesforce/messageChannel/PartsListUpdate__c';
import searchBoards from '@salesforce/apex/PartsController.searchBoards';
export default class PartsList extends LightningElement {
    searchBoardTerm = '';
    boards;
    
    @wire(MessageContext) messageContext;
    @wire(searchBoards, {searchBoardTerm: '$searchBoardTerm'})
    loadBoards(result) {
        this.boards = result;
        if(result.data) {

            const message ={
                boards: result.data
            };
            publish(this.messageContext, PART_LIST_UPDATE_MESSAGE, message);
        }
    }

    handleSearchTermChange(e) {
		window.clearTimeout(this.delayTimeout);
		const searchBoardTerm = e.target.value;
		this.delayTimeout = setTimeout(() => {
			this.searchBoardTerm = searchBoardTerm;
		}, 300);
	}
	get hasResults() {
		return (this.partsBoards.data.length > 0);
    }
    handlePartBoardView(e) {
        const partBoardId = e.detail;
    }

    
}