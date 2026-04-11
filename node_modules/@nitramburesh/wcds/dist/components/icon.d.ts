import { LitElement, TemplateResult } from 'lit';
import { Icon, Size } from '../types';
export declare class WCDSIcon extends LitElement {
    icon: Icon;
    size: Size;
    static styles: import('lit').CSSResult[];
    render(): TemplateResult<1> | null;
}
declare global {
    interface HTMLElementTagNameMap {
        'wcds-icon': WCDSIcon;
    }
}
export type { Icon, Size } from '../types';
//# sourceMappingURL=icon.d.ts.map