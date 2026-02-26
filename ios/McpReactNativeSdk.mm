#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Comsense, NSObject)

RCT_EXTERN_METHOD(callNativeMethod:(NSString *)methodName
                  params:(NSArray *)params
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(setCampaignHandler:(NSString *)target)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
