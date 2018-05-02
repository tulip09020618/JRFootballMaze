//
//  JRUserDefaultsManager.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/22.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRUserDefaultsManager : NSObject

/**
 保存当前关卡

 @param levelIndex 当前关卡
 */
+ (void)saveCurrentLevel:(NSInteger)levelIndex;

/**
 获取当前关卡
 */
+ (NSInteger)getCurrentLevel;

/**
 保存上报极光推送token记录
 */
+ (void)saveUploadJPushTokenRecord;

/**
 移除上报极光token记录
 */
+ (void)removeUploadJPushTokenRecord;

/**
 查询上报极光token记录

 @return 是否已经上报
 */
+ (BOOL)getUploadJPushTokenRecord;

@end
