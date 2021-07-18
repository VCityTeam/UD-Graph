import { EventSender } from "ud-viz/src/Widgets/Components/Events/EventSender";

export class SparqlEndpointService extends EventSender {

    /**
     * Creates a SPARQL Endpoint Service which contains connection information for
     * a specific SPARQL Endpoint.
     *
     * @param {object} config The configuration of UD-Viz.
     * @param {string} config.url The server url.
     */
    constructor(config) {
        super();
        this.url = config.url;

        this.registerEvent(SparqlEndpointService.EVENT_QUERY_SENT);
        this.registerEvent(SparqlEndpointService.EVENT_QUERY_RESPONSE);
    }

    /**
     * Send an HTTP request SPARQL endpoint in the form of a SPARQL query.
     *
     * @async
     *
     * @returns {string}
     */
    async queryEndpoint(query) {
        // TODO: Implement me!
        console.log('queryEndpoint happened')
        return '';
    }

    // EVENTS //
    static get EVENT_QUERY_SENT() {
        return 'EVENT_QUERY_SENT';
    }

    static get EVENT_QUERY_RESPONSE() {
        return 'EVENT_QUERY_RESPONSE';
    }
}