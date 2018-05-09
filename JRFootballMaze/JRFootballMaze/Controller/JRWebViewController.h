//
//  JRWebViewController.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/5/9.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRWebViewController : UIViewController

@property (nonatomic, strong) NSString *address;

/**
 刷新网页

 @param address 网页地址
 */
- (void)refreshWithAddress:(NSString *)address;

@end
