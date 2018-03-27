#import <Cordova/CDVPlugin.h>

@interface VoiceCordovaPlugin : CDVPlugin {
}

// The hooks for our plugin commands
- (void)isSiriInitilized:(CDVInvokedUrlCommand *)command;
- (void)getDate:(CDVInvokedUrlCommand *)command;
- (void)clearData:(CDVInvokedUrlCommand *)command;
- (void)setSupportedCurrency:(CDVInvokedUrlCommand *)command;

@end
