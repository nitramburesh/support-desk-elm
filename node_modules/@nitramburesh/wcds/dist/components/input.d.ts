import { LitElement } from 'lit';
import { Icon, Size } from '../types';
/**
 * @tagname wcds-input
 * @summary A customizable input component with label, icons, validation, and error display.
 * @fires input - Emitted on input with { value }.
 * @fires change - Emitted on blur with { value }.
 * @fires clear-error - Emitted when the user starts typing to clear existing errors.
 * @cssproperty --wcds-input-padding - Padding inside the input field.
 * @cssproperty --wcds-input-border-radius - Border radius of the input field.
 * @cssproperty --wcds-input-border-color-default - Border color of the input field.
 * @cssproperty --wcds-input-border-color-focus - Outline color of the input field on focus.
 * @cssproperty --wcds-input-box-shadow - Box shadow of the input field on focus.
 * @cssproperty --wcds-input-icon-color - Color of the input icon (defaults to neutral).
 */
export declare class WCDSInput extends LitElement {
    id: string;
    value: string;
    size: Size;
    label?: string;
    placeholder?: string;
    icon?: Icon;
    disabled: boolean;
    error?: string;
    private _hasIcon;
    private _onInput;
    private _onChange;
    protected updated(changedProperties: Map<string, unknown>): void;
    static styles: import('lit').CSSResult[];
    render(): import('lit').TemplateResult<1>;
}
declare global {
    interface HTMLElementTagNameMap {
        'wcds-input': WCDSInput;
    }
}
export type { Icon, Size } from '../types';
//# sourceMappingURL=input.d.ts.map