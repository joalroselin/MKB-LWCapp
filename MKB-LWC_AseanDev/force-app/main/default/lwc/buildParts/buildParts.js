import { LightningElement, track } from 'lwc';

export default class BuildParts extends LightningElement {
    @track openModal = false;
    handleAddPart() {
        this.handleAddPart = true;
    }
    closeModal() {
        this.handleAddPart = false;
    }
    submitDetails() {
        this.handleAddPart = false;
    }
}