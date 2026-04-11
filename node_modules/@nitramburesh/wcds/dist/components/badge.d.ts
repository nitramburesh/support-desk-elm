import { LitElement } from 'lit';
/**
 * @tagname wcds-badge
 * @summary Small status badge with four variants.
 * @slot - Badge text/content.
 * @cssproperty --wcds-badge-padding - Inner padding.
 * @cssproperty --wcds-badge-radius - Border radius.
 * @cssproperty --wcds-badge-font-size - Font size.
 * @cssproperty --wcds-badge-bg - Background color.
 * @cssproperty --wcds-badge-fg - Text color.
 */
export declare class WCDSBadge extends LitElement {
    variant: 'info' | 'success' | 'warning' | 'error';
    static styles: import('lit').CSSResult[];
    render(): import('lit').TemplateResult<1>;
}
declare global {
    interface HTMLElementTagNameMap {
        'wcds-badge': WCDSBadge;
    }
}
//# sourceMappingURL=badge.d.ts.map