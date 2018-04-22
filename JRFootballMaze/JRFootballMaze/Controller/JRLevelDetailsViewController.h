//
//  JRLevelDetailsViewController.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRLevelDetailsViewController : UIViewController

/**
 第几关
 */
@property (nonatomic, assign) NSInteger levelIndex;

/**
 闯关成功
 */
@property (nonatomic, strong) void (^success) (NSInteger levelIndex);

@end
