//
//  JRLevelDetailsViewController.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MODE_TYPE) {
    MODE_TYPE_LEVEL, // 闯关模式
    MODE_TYPE_RANDOM, // 随机模式
};

@interface JRLevelDetailsViewController : UIViewController

/**
 模式类型
 */
@property (nonatomic, assign) MODE_TYPE type;

/**
 第几关
 */
@property (nonatomic, assign) NSInteger levelIndex;

/**
 闯关成功
 */
@property (nonatomic, strong) void (^success) (NSInteger levelIndex);

@end
