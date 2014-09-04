//
//  NSString+infoCollection.h
//  AppNetwork
//
//  Created by Aladdin Zhang on 7/26/11.
//  Copyright 2011 innovation-works. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MobClickOpenUDID.h"

void umengLog(NSString *format, ...);

@interface UMANUtil : NSObject


#pragma mark SDK_Protocol info
+ (NSString *)sdkVersionString;//sdk_version
+ (NSString *)protocolVersionString;//
+ (NSString *)sdkTypeString;//sdk_type

#pragma mark session info
+ (NSString *)accessString;//access

+ (NSString *)timeString;

+ (NSString *)dateString;

#pragma mark device info

+ (NSString *)deviceIDString;

+ (NSString *)deviceMacAddressString;

+ (NSString *)md5Value:(NSString *)string;
//device_id
+ (NSString *)deviceIDMD5String;//idmd5
+ (NSString *)deviceModelString;//device_model
+ (NSString *)osString;//os
+ (NSString *)osVersionString;//os_version
+ (NSString *)timezoneString;//timezone
+ (NSString *)resolutionString;//resolution
+ (NSString *)carrierString;//carrier
//cpu
+ (NSString *)orientationString;

+ (NSString *)countryString;//country
+ (NSString *)languageString;//language
+ (NSString *)deviceJailBreakString;//is_jailbroken

+ (NSString *)openUDIDString;//OPENUDID

#pragma mark ipa info
+ (NSString *)appPackageNameString;//package_name
+ (NSString *)appDisplayNameString;//display_name
+ (NSString *)appVersionString;//app_version
+ (NSString *)appShortVersionString;//ShortVersion
+ (NSString *)appPirateString;//is_pirated

+ (NSString *)urlEncode:(NSString *)string;

+ (NSString *)JSONFragment:(id)object;

+ (id)JSONValue:(NSString *)string;

+ (NSData *)deflatedData:(NSData *)sourceData;

+ (NSData *)deflatedDataPrefixedWith:(NSData *)inPrefix level:(int)inLevel source:(NSData *)sourceData;

+ (BOOL)isPad;

+ (BOOL)isDeviceJailBreak;

+ (BOOL)isAppPirate;

+(NSString *)sessionId;

+(NSString *)umStringDecode:(NSString *)source;
+(NSString *)umStringEncode:(NSString *)source;

@end