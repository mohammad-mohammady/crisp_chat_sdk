#import "CrispChatSdkPlugin.h"
#if __has_include(<crisp_chat_sdk/crisp_chat_sdk-Swift.h>)
#import <crisp_chat_sdk/crisp_chat_sdk-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "crisp_chat_sdk-Swift.h"
#endif

@implementation CrispChatSdkPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCrispChatSdkPlugin registerWithRegistrar:registrar];
}
@end
