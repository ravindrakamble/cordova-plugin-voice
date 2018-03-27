#import "VoiceCordovaPlugin.h"

#import <Cordova/CDVAvailability.h>

@implementation VoiceCordovaPlugin

- (void)pluginInitialize {
}

- (void)isSiriInitilized:(CDVInvokedUrlCommand *)command {
    
    NSData *dataACH = [[NSUserDefaults standardUserDefaults] objectForKey:@"selectedBeni"];
    NSMutableDictionary * token = [NSKeyedUnarchiver unarchiveObjectWithData:dataACH];
    NSLog(@"%@",token);
    
    NSMutableDictionary *Dict=[[NSMutableDictionary alloc]init];
    [Dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"payeeName"] forKey:@"payeeName"];
    [Dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"amount"] forKey:@"amount"];
    [Dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"note"] forKey:@"note"];
    [Dict setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"currencyCode"] forKey:@"currencyCode"];
    [Dict setValue:token forKey:@"selectedBeniDetails"];
    
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:Dict];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)getDate:(CDVInvokedUrlCommand *)command {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    [dateFormatter setLocale:enUSPOSIXLocale];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    
    NSDate *now = [NSDate date];
    NSString *iso8601String = [dateFormatter stringFromDate:now];
    
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)clearData:(CDVInvokedUrlCommand *)command
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"payeeName"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"amount"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"note"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"currencyCode"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"selectedBeni"];
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName: @"group.com.uaeex.gcc"];
    [defaults removeObjectForKey:@"selectedBeni"];
   
    NSString *dataClear=@"dataCleared";
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:dataClear];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

- (void)setSupportedCurrency:(CDVInvokedUrlCommand *)command
{
    NSString *currencyName=[command.arguments objectAtIndex:0];
    [[NSUserDefaults standardUserDefaults] setValue:currencyName forKey:@"supportedCurrency"];
    
    NSString *data = [NSString stringWithFormat:@"supported currency is set to:%@",currencyName];
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:data];
    [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
    
}

@end

