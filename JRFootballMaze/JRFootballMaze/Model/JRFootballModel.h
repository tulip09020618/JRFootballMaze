//
//  JRFootballModel.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JRFootballModel : NSObject

// 坐标(row,col)

/**
 行
 */
@property (nonatomic, assign) NSInteger row;

/**
 列
 */
@property (nonatomic, assign) NSInteger col;

/**
 初始化：设置行和列，默认均为不可移动
 
 @param row 行
 @param col 列
 */
- (instancetype)initWithRow:(NSInteger)row withCol:(NSInteger)col;

@end
