export declare class CampaignHandler {
    private eventEmitter;
    constructor();
    /**
     * Register the native campaign handler with a specific target string.
     * This must be called to enable campaign data reception.
     * @param target Target name from Personalization UI (e.g., "featuredProduct")
     */
    registerCampaignHandler(target: string): Promise<void>;
    /**
     * Start listening for campaign data and pass it to the callback.
     * @param callback A function to receive campaign JSON from native
     */
    startListening(callback: (campaignData: any) => void): void;
    /**
     * Remove all campaign event listeners to prevent memory leaks.
     */
    removeListeners(): void;
}
export declare const campaignHandler: CampaignHandler;
//# sourceMappingURL=campaignHandler.d.ts.map