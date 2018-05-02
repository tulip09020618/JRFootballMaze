//
//  JRUserDefaultsManager.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/22.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRUserDefaultsManager.h"

#define USERDEFAULTS_LEVEL_INDEX @"userDefaultsLevelIndex" // 当前关卡
#define USERDEFAULTS_JPUSH_TOKEN @"userDefaultsJPushToken" // 极光token

@implementation JRUserDefaultsManager

/**
 保存当前关卡
 
 @param levelIndex 当前关卡
 */
+ (void)saveCurrentLevel:(NSInteger)levelIndex {
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:levelIndex] forKey:USERDEFAULTS_LEVEL_INDEX];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 获取当前关卡
 */
+ (NSInteger)getCurrentLevel {
    NSNumber *levelNum = [[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULTS_LEVEL_INDEX];
    if (levelNum == nil) {
        [self saveCurrentLevel:1];
        return 1;
    }
    
    return [levelNum integerValue];
}
    
/**
 保存上报极光推送token记录
 */
+ (void)saveUploadJPushTokenRecord {
    [[NSUserDefaults standardUserDefaults] setObject:@"yes" forKey:USERDEFAULTS_JPUSH_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
    
/**
 移除上报极光token记录
 */
+ (void)removeUploadJPushTokenRecord {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:USERDEFAULTS_JPUSH_TOKEN];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
    
/**
 查询上报极光token记录
 
 @return 是否已经上报
 */
+ (BOOL)getUploadJPushTokenRecord {
    NSString *jpushToken = [[NSUserDefaults standardUserDefaults] objectForKey:USERDEFAULTS_JPUSH_TOKEN];
    if (jpushToken != nil) {
        return YES;
    }
    return NO;
}

@end
