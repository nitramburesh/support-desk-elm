import { LitElement } from 'lit';
import { AvatarVariant, Size } from '../types';
/**
 * @tagname wcds-avatar
 * @summary User avatar with image or initials and Material-like shapes.
 * @slot - Avatar content (overrides initials fallback when provided).
 * @cssproperty --wcds-avatar-size - Overall size of the avatar.
 * @cssproperty --wcds-avatar-radius - Border radius for the avatar shape.
 * @cssproperty --wcds-avatar-bg - Background color for fallback initials.
 * @cssproperty --wcds-avatar-fg - Text color for fallback initials.
 * @cssproperty --wcds-avatar-font-size - Font size for fallback initials.
 */
export declare class WCDSAvatar extends LitElement {
    src?: string;
    alt?: string;
    name?: string;
    variant: AvatarVariant;
    size: Size;
    private imageError;
    private handleError;
    private get fallbackText();
    static styles: import('lit').CSSResult[];
    render(): import('lit').TemplateResult<1>;
}
declare global {
    interface HTMLElementTagNameMap {
        'wcds-avatar': WCDSAvatar;
    }
}
export type { AvatarVariant, Size } from '../types';
//# sourceMappingURL=avatar.d.ts.map