import './SparqlModule.css';

import { Widgets } from 'ud-viz';

export class SparqlQueryWindow extends Widgets.Components.Window {
    constructor() {
        super('sparqlQueryWindow', 'SPARQL Query');

        this.default_query = `
SELECT ?subject ?object ?predicate
WHERE {
    ?subject ?object ?predicate .
}`
    }

    get innerContentHtml() {
        return /*html*/ `
        <div>
            <label for="query_input">Query:</label><br>
            <textarea id="query_input" rows="10" cols="50">${this.default_query}</textarea>
            <input type="submit" value="Send">
        </div>
      `;
    }
}