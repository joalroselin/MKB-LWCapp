import { LightningElement, api, wire } from 'lwc';

// Lightning Message Service and message channels
import { publish, subscribe, MessageContext } from 'lightning/messageService';
import PRODUCTS_FILTERED_MESSAGE from '@salesforce/messageChannel/ProductsFiltered__c';
import PRODUCT_SELECTED_MESSAGE from '@salesforce/messageChannel/ProductSelected__c';

// getProducts() method in ProductController Apex class
import getProducts from '@salesforce/apex/PartsController.getAllBoards';

export default class PartsList extends LightningElement {
    searchBoardTerm = '';
    partsBoards;
    
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