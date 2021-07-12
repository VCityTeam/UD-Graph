import './SparqlModule.css';

import { ModuleView, Window } from 'ud-viz'

export class SparqlModuleView extends ModuleView {
    constructor() {
        super()
    
        /**
         * The SPARQL query window.
         *
         * @type {SparqlQueryWindow}
         */
        this.sparqlQueryWindow = new SparqlQueryWindow();
    
        /**
         * The different windows of the view.
         *
         * @type {Array<Window>}
         */
        this.windows = [];
    
        this.addWindow(this.sparqlQueryWindow);
    
        this.navigatorWindow.addEventListener(Window.EVENT_DISABLED, () => {
          this.disable();
        });

    }

    // TODO: implement addWindow() method

    // Display the view
    enableView() {
        this.appendToElement(this.parentElement); //calls a method that creates the DOM elements
    }

    // Close the view
    disableView() {
        this.dispose(); //This methods destroys the DOM elements
    }
}