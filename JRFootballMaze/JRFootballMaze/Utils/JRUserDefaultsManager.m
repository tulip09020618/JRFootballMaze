//
//  JRUserDefaultsManager.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/22.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRUserDefaultsManager.h"

#define USERDEFAULTS_LEVEL_INDEX @"userDefaultsLevelIndex" // 当前关卡

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

@end
