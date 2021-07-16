import { Widgets } from 'ud-viz'
import { SparqlEndpointService } from './SparqlEndpointService';
import { SparqlQueryWindow } from './SparqlQueryWindow';

export class SparqlModuleView extends Widgets.Components.ModuleView {
    constructor() {
        super()
    
        /**
         * Contains connection information for the SPARQL endpoint service.
         *
         * @type {SparqlEndpointService}
         */
        this.config = {'url': 'http://localhost:9999/strabon/'};
        this.service = new SparqlEndpointService(this.config);
    
        /**
         * Contains a SparqlQueryWindow for capturing user input.
         *
         * @type {SparqlQueryWindow}
         */
        this.view = new SparqlQueryWindow();
    }

    // Display the view
    enableView() {
        this.view.appendTo(this.parentElement);
    }

    // Close the view
    disableView() {
        this.view.dispose();
    }
}