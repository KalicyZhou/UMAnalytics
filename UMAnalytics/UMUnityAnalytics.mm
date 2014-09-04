//
//  UMUnityAnalytics.m
//  UMUnityAnalytics
//
//  Created by Aladdin on 9/11/12.
//  Copyright (c) 2012 iAladdin. All rights reserved.
//

#import "UMUnityAnalytics.h"
#import <Foundation/Foundation.h>

#import "MobClick.h"
#import "UMANUtil.h"
#import "MobClick+Private.h"
#ifdef __cplusplus
extern "C" {
#endif
    void UnitySendMessage(const char* obj, const char* method, const char* msg);
#ifdef __cplusplus
}
#endif

static MobClick *pluginManagerSharedInstance = nil;

@interface MobclickUnityPluginsManager : NSObject <MobClickDelegate>{
@private
    
}
+ (id)sharedInstance;
@end

#pragma mark - Utility Function

static NSString* CreateNSString (const char* string) {
    return [NSString stringWithUTF8String:(string ? string : "")];
}

static char* MakeHeapString(const char* string) {
    if (!string){
        return NULL;
    }
    char* mem = static_cast<char*>(malloc(strlen(string) + 1));
    if (mem) {
        strcpy(mem, string);
    }
    return mem;
}

#pragma mark -
#pragma mark unity interface
///---------------------------------------------------------------------------------------------------------------
/// @name unity plugins
///---------------------------------------------------------------------------------------------------------------
extern "C" void _SetAppVersion(const char* appVersion);
extern "C" const char * _GetAgentVersion();
extern "C" void _SetCrashReportEnabled(bool value);
extern "C" void _SetLogEnabled(bool value);
extern "C" void _StartWithAppKeyAndReportPolicyAndChannelId(const char* appkey,ReportPolicy policy,const char * channelId);
extern "C" void _SetLogSendInterval(double interval);
extern "C" void _Event(const char* eventId);
extern "C" void _EventWithLabel(const char* eventId, const char* label);
extern "C" void _EventWithAccumulation(const char* eventId,int accumulation);
extern "C" void _EventWithLabelAndAccumulation(const char* eventId, const char* label,int accumulation);
extern "C" void _EventWithAttributes(const char* eventId,const char * jsonString);
extern "C" void _BeginEventWithLabel(const char* eventId,const char* label);
extern "C" void _EndEventWithLabel(const char* event,const char* label);
extern "C" void _BeginEventWithPrimarykeyAndAttributes(const char* eventId,const char* primaryKey,const char * jsonString);
extern "C" void _EndEventWithPrimarykey(const char* eventId,const char* primaryKey);
extern "C" void _CheckUpdate();
extern "C" void _CheckUpdateAndCancelButtonTitleAndOtherButtonTitles(const char* title,const char*cancelBtnTitle,const char* otherBtnTitle);
extern "C" void _UpdateOnlineConfig();
extern "C" const char * _GetConfigParamsForKey(const char * key);
extern "C" const char * _GetConfigParams();
extern "C" void _LogPageViewWithSeconds(const char* pageName,int seconds);
extern "C" void _BeginLogPageView(const char* pageName);
extern "C" void _EndLogPageView(const char* pageName);
extern "C" void setLatitudeAndLongitude(double latitude,double longitude);
extern "C" bool _IsJailBroken();
extern "C" bool _IsPirated();

extern "C" void _SetAppVersion(const char* appVersion){
    NSString * value = CreateNSString(appVersion);
    [MobClick  setAppVersion:value];
}

/** 获取SDK的版本信息
 *
 * 通过SDK内的宏定义定义的版本信息
 * @return const char *
 */

extern "C" const char * _GetAgentVersion(){
    NSString * retStr = [MobClick getAgentVersion];
    return MakeHeapString(retStr.UTF8String);
}

/** 获取SDK的版本信息
 *
 * 通过SDK内的宏定义定义的版本信息
 * @return const char *
 */

extern "C" void _SetCrashReportEnabled(bool value){
    [MobClick setCrashReportEnabled:value];
}

/** 获取SDK的版本信息
 *
 * 通过SDK内的宏定义定义的版本信息
 * @return const char *
 */
extern "C" void _SetLogEnabled(bool value){
    [MobClick  setLogEnabled:value];
}

extern "C" void _StartWithAppKeyAndReportPolicyAndChannelId(const char* appkey,ReportPolicy policy,const char * channelId){
    NSString * key = CreateNSString(appkey);
    NSString * channel = CreateNSString(channelId);
    

    [MobClick startWithAppkey:key reportPolicy:policy channelId:channel];
    [[MobClick class] performSelector:@selector(setWrapperVersion:) withObject:@"1.0"];
    [[MobClick class] performSelector:@selector(setWrapperType:) withObject:@"Unity"];
    [MobClick setDelegate:[MobclickUnityPluginsManager sharedInstance] reportPolicy:policy];
    [MobClick startSession:nil];

}


extern "C" void _SetLogSendInterval(double interval){
    [MobClick setLogSendInterval:interval];
}

extern "C" void _Event(const char* eventId){
    NSString * event = CreateNSString(eventId);
    [MobClick event:event];
}


extern "C" void _EventWithLabel(const char* eventId, const char* label){
    NSString * event = CreateNSString(eventId);
    NSString * lab = CreateNSString(label);
    [MobClick event:event label:lab];
}


extern "C" void _EventWithAccumulation(const char* eventId,int accumulation){
    NSString * event = CreateNSString(eventId);
    [MobClick event:event acc:accumulation];
}


extern "C" void _EventWithLabelAndAccumulation(const char* eventId, const char* label,int accumulation){
    NSString * event = CreateNSString(eventId);
    NSString * lab = CreateNSString(label);
    [MobClick event:event label:lab acc:accumulation];
}


extern "C" void _EventWithAttributes(const char* eventId,const char * jsonString){
    NSString * jsonStr = CreateNSString(jsonString);
    NSDictionary * values = [UMANUtil JSONValue:jsonStr];
    NSString * event = CreateNSString(eventId);
    if (values) {
        [MobClick event:event attributes:values];
    }
}


extern "C" void _BeginEventWithLabel(const char* eventId,const char* label){
    NSString * eventStr = CreateNSString(eventId);
    NSString * labelStr = CreateNSString(label);
    [MobClick beginEvent:eventStr label:labelStr];
    
}

extern "C" void _EndEventWithLabel(const char* event,const char* label){
    NSString * eventStr = CreateNSString(event);
    NSString * labelStr = CreateNSString(label);
    [MobClick endEvent:eventStr label:labelStr];
}


extern "C" void _BeginEventWithPrimarykeyAndAttributes(const char* eventId,const char* primaryKey,const char * jsonString){
    NSString * eventStr = CreateNSString(eventId);
    NSString * primaryKeyStr = CreateNSString(primaryKey);
    NSString * jsonStringStr = CreateNSString(jsonString);
    NSDictionary * values = [UMANUtil JSONValue:jsonStringStr];
    [MobClick beginEvent:eventStr primarykey:primaryKeyStr attributes:values];
}

extern "C" void _EndEventWithPrimarykey(const char* eventId,const char* primaryKey){
    NSString * eventStr = CreateNSString(eventId);
    NSString * primaryKeyStr = CreateNSString(primaryKey);
    [MobClick endEvent:eventStr primarykey:primaryKeyStr];
}


extern "C" void _CheckUpdate(){
    [MobClick checkUpdate];
}


extern "C" void _CheckUpdateAndCancelButtonTitleAndOtherButtonTitles(const char* title,const char*cancelBtnTitle,const char* otherBtnTitle){
    NSString * titleString = CreateNSString(title);
    NSString * cancelBtnString = CreateNSString(cancelBtnTitle);
    NSString * otherBtnString = CreateNSString(otherBtnTitle);
    
    [MobClick checkUpdate:titleString
        cancelButtonTitle:cancelBtnString
        otherButtonTitles:otherBtnString];
}

extern "C" void _UpdateOnlineConfig(){
    [MobClick updateOnlineConfig];
}


extern "C" const char * _GetConfigParamsForKey(const char * key){
    return MakeHeapString([MobClick getConfigParams:CreateNSString(key)].UTF8String);
}


extern "C" const char * _GetConfigParams(){
    NSDictionary * dict = [MobClick getConfigParams];
    return MakeHeapString([UMANUtil JSONFragment:dict].UTF8String);
}


extern "C" void _LogPageViewWithSeconds(const char* pageName,int seconds){
    NSString * page = CreateNSString(pageName);
    [MobClick logPageView:page seconds:seconds];
}


extern "C" void _BeginLogPageView(const char* pageName){
    NSString * page = CreateNSString(pageName);
    [MobClick beginLogPageView:page];
}


extern "C" void _EndLogPageView(const char* pageName){
    NSString * page = CreateNSString(pageName);
    [MobClick endLogPageView:page];
}


extern "C" void setLatitudeAndLongitude(double latitude,double longitude){
    [MobClick setLatitude:latitude longitude:longitude];
}


extern "C" bool _IsJailBroken(){
    return [MobClick isJailbroken];
}


extern "C" bool _IsPirated(){
    return [MobClick isPirated];
}

@implementation MobclickUnityPluginsManager
+ (void)initialize {
    
    if (pluginManagerSharedInstance == nil) {
        pluginManagerSharedInstance = [[self alloc] init];
    }
}

+ (id)sharedInstance {
    return pluginManagerSharedInstance;
}

- (void)appUpdate:(NSDictionary *)appUpdateInfo{
    NSString * jsonStr = [UMANUtil JSONFragment:appUpdateInfo];
    UnitySendMessage("UmengManager","updateCallBack",jsonStr.UTF8String);
}
@end
//extern "C" void _EventWithLabelAndValues