//
//  MobClick+Private.h
//  MobClick
//
//  Created by Aladdin Zhang on 9/14/11.
//  Copyright (c) 2011 Innovation-Works. All rights reserved.
//

#ifndef MobClick_MobClick_Private_h
#define MobClick_MobClick_Private_h

#import "MobClick.h"
#import "UMANUtil.h"
typedef enum{
	kSEND_REALTIME = 0,
    kSEND_LAUNCH = 1,
    kSEND_ON_EXIT = 2,
    kSEND_DAILY = 4,
    kSEND_ONLY_WIFI = 5,
    kSEND_INTERVAL = 6
}ReportPolicies;

typedef enum{
	kUmengLogLaunch = 0,
    kUmengLogTerminate,
    kUmengLogEvent,
    kUmengLogFeedback,
    kUmengLogError

}LogEventTypes;

#define UM_APP_VERSION @"UMAppVersion"

@class MobClickInternal;
@interface MobClick (Private)
- (MobClickInternal *)internal;
+(id)sharedInstance;
+ (id)sharedInternal;
+ (BOOL)hasUmengJobRunning;
+ (BOOL)umengLogEnabled;
+ (void)setAppCrashed:(BOOL)isCrashed;
+ (void)setUmengJobRunning:(BOOL)isRunning;
+(unsigned int)umengJobPolicy;
+(NSString *)sessionID;
+ (void)preparePerformJob:(int)logType;
+ (void)launchJob;
+ (void)setReportPolicy:(ReportPolicy)newPolicy;

+ (NSMutableArray *)umengPageViews;
- (NSString *)appKey;
- (int)gender;
- (NSString *)user_id;
- (int)age;
- (NSString *)channelId;

+ (void)setWrapperType:(NSString *)type;

+ (void)setWrapperVersion:(NSString *)version;
@end

#endif
