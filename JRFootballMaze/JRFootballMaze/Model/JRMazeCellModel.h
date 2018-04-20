//
//  JRMazeCellModel.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, DIRECTION_TYPE) {
    DIRECTION_TYPE_LEFT, // 左
    DIRECTION_TYPE_UP, // 上
    DIRECTION_TYPE_RIGHT, // 右
    DIRECTION_TYPE_DOWN, // 下
};

// 迷宫的一个最小单元的模型
@interface JRMazeCellModel : NSObject

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
 左：是否可以向左移动
 */
@property (nonatomic, assign) BOOL canLeft;

/**
 上：是否可以向上移动
 */
@property (nonatomic, assign) BOOL canUp;

/**
 右：是否可以向右移动
 */
@property (nonatomic, assign) BOOL canRight;

/**
 下：是否可以向下移动
 */
@property (nonatomic, assign) BOOL canDown;

/**
 初始化：设置行和列，默认均为不可移动

 @param row 行
 @param col 列
 */
- (instancetype)initWithRow:(NSInteger)row withCol:(NSInteger)col;

/**
 开启某个方向，使某个方向可以移动
 */
- (void)openDirection:(DIRECTION_TYPE)direction;

@end
