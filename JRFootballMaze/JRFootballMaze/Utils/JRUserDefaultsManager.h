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

@end
