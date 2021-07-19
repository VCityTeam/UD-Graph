import { Widgets } from 'ud-viz'
import { SparqlEndpointService } from './SparqlEndpointService';
import { SparqlQueryWindow } from './SparqlQueryWindow';

export class SparqlModuleView extends Widgets.Components.ModuleView {
    /**
     * Creates a new SparqlModuleView.
     *
     * @param {object} config The configuration of UD-Viz.
     * @param {object} config.sparqlModule The sparqlModule configuration.
     * @param {string} config.sparqlModule.url The SPARQL endpoint url.
     */
    constructor(config) {
        super()
    
        /**
         * Contains connection information for the SPARQL endpoint service.
         *
         * @type {SparqlEndpointService}
         */
        this.config = config;
        this.service = new SparqlEndpointService(this.config);

        /**
         * Contains a SparqlQueryWindow for capturing user input.
         *
         * @type {SparqlQueryWindow}
         */
        this.window = new SparqlQueryWindow(this.service);
    }

    /**
     * Display the view
     */
    enableView() {
        this.window.appendTo(this.parentElement);
    }

    /**
     *  Close the view
     */
    disableView() {
        this.window.dispose();
    }
}