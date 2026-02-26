import { campaignHandler } from './campaignHandler';
/**
 * Call a native Evergage method dynamically.
 * @param methodName Name of the method in Evergage SDK
 * @param params Parameters to pass to the method
 * @returns Promise with the result
 */
export declare function callEvergageMethod(methodName: string, params?: any[]): Promise<any>;
export { campaignHandler };
declare const _default: {
    callEvergageMethod: typeof callEvergageMethod;
    campaignHandler: import("./campaignHandler").CampaignHandler;
};
export default _default;
//# sourceMappingURL=index.d.ts.map