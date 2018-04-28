//
//  JRUtils.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JRUtils : NSObject

#pragma mark --弹框提示
+ (void)showAlertViewWithTitle:(NSString *)title
                   withMessage:(NSString *)message
               withActionTitle:(NSString *)actionTitle
              withActionMothed:(void (^)(void))actionMothed
               withCancelTitle:(NSString *)cancelTitle
              withCancelMothed:(void (^)(void))cancelMothed
            withViewController:(UIViewController *)viewController;

@end
