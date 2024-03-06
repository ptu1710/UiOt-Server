import {css, html, TemplateResult} from "lit";
import {customElement} from "lit/decorators.js";
import manager from "@openremote/core";
import "@openremote/or-components/or-panel";
import "@openremote/or-translate";
import {Store} from "@reduxjs/toolkit";
import {Page, PageProvider} from "@openremote/or-app";
import {AppStateKeyed} from "@openremote/or-app";

export function pageAccountProvider(store: Store<AppStateKeyed>): PageProvider<AppStateKeyed> {
    return {
        name: "account",
        routes: [
            "/account"
        ],
        pageCreator: () => {
            return new PageAccount(store);
        }
    };
}

@customElement("page-account")
export class PageAccount extends Page<AppStateKeyed>  {

    static get styles() {
        // language=CSS
        return css`
            iframe {
                width: 100%;
                border: none;
            }
        `;
    }

    get name(): string {
        return "account";
    }

    constructor(store: Store<AppStateKeyed>) {
        super(store);
    }

    protected render(): TemplateResult | void {

        if (!manager.authenticated) {
            return html`
                <or-translate value="notAuthenticated"></or-translate>
            `;
        }

        if (!manager.isKeycloak()) {
            return html`
                <or-translate value="notSupported"></or-translate>
            `;
        }

        return html`
            <iframe .src="${manager.keycloakUrl + "/realms/" + manager.getRealm() + "/account/"}"></iframe>
        `;
    }

    public stateChanged(state: AppStateKeyed) {
    }
}
