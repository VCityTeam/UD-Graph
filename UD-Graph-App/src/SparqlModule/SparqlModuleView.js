import './SparqlModule.css';
import { Widgets } from 'ud-viz'
import { SparqlEndpointService } from './SparqlEndpointService';

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
    }

    // Display the view
    enableView() {
        this.appendTo(this.parentElement);
    }

    // Close the view
    disableView() {
        this.dispose();
    }
    
    get html() {
        return /*html*/ `
        <div>
            <label for="query_input">Query:</label><br>
            <textarea id="query_input" rows="10" cols="50">SELECT
WHERE {

}</textarea>
        </div>
      `;
    }
}