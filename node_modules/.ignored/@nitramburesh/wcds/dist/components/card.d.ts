import { LitElement } from 'lit';
/**
 * @tagname wcds-card
 * @summary Container card with header/body/footer slots, size and variant styles.
 * @slot header - Optional header content (title, actions).
 * @slot - Default body content.
 * @slot footer - Optional footer content (buttons, meta).
 * @cssproperty --wcds-card-padding - Padding inside the card.
 * @cssproperty --wcds-card-radius - Border radius of the card.
 * @cssproperty --wcds-card-bg-color - Background color.
 * @cssproperty --wcds-card-border-color - Border color (outlined/plain).
 * @cssproperty --wcds-card-shadow - Box shadow (elevated).
 */
export declare class WCDSCard extends LitElement {
    static styles: import('lit').CSSResult[];
    render(): import('lit').TemplateResult<1>;
}
declare global {
    interface HTMLElementTagNameMap {
        'wcds-card': WCDSCard;
    }
}
//# sourceMappingURL=card.d.ts.map