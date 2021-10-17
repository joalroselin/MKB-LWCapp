import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class ButtonOnclick extends LightningElement {

    @api tabName;
    @api toggleButtonLabel;
    
    toggleIconName = 'utility:preview';
    toggleButtonLabel = 'Hide content';

    // when the component is first initialized assign an initial value to the `greekLetter` variable


    // Handles click on the 'Show/hide content' button
    handleToggleClick() {
        // retrieve the classList from the specific element
        const contentBlockClasslist = this.template.querySelector(
            '.lgc-id_content-toggle'
        ).classList;
        // toggle the hidden class
        contentBlockClasslist.toggle('slds-hidden');

        // if the current icon-name is `utility:preview` then change it to `utility:hide`
        if (this.toggleIconName === 'utility:preview') {
            this.toggleIconName = 'utility:hide';
            this.toggleButtonLabel = 'Reveal content';
        } else {
            this.toggleIconName = 'utility:preview';
            this.toggleButtonLabel = 'Hide content';
        }
    }

    
}
