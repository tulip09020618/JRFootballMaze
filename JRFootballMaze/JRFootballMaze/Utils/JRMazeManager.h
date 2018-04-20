//
//  JRMazeManager.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRMazeView.h"

@interface JRMazeManager : NSObject

/*
 迷宫管理类
 功能：
    - 生成迷宫
    - 生成足球
    - 移动足球
 */

+ (JRMazeManager *)manager;

/**
 生成rows行cols列的迷宫

 @param rows 迷宫总行数
 @param cols 迷宫总列数
 @param space 每个单元格的宽高
 */
- (JRMazeView *)generateMazeWithRows:(NSInteger)rows withCols:(NSInteger)cols withSpace:(NSInteger)space;

@end
