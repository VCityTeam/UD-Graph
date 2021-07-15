export class SparqlEndpointService {
    /**
     * Creates a SPARQL Endpoint Service which contains connection information for
     * a specific SPARQL Endpoint.
     *
     * @param {object} config The configuration of UD-Viz.
     * @param {string} config.url The server url.
     */
    constructor(config) {
        this.url = config.url;
    }
}