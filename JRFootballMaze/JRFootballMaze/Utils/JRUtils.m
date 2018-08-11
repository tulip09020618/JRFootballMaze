//
//  JRUtils.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRUtils.h"
#import "JRWebViewController.h"
#import <AVOSCloud/AVOSCloud.h>

JRWebViewController *webVC;

@interface JRUtils ()
@end

@implementation JRUtils

#pragma mark --弹框提示
+ (void)showAlertViewWithTitle:(NSString *)title
                   withMessage:(NSString *)message
               withActionTitle:(NSString *)actionTitle
              withActionMothed:(void (^)(void))actionMothed
               withCancelTitle:(NSString *)cancelTitle
              withCancelMothed:(void (^)(void))cancelMothed
            withViewController:(UIViewController *)viewController
{
    
    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertCon addAction:[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (actionMothed) {
            actionMothed();
        }
    }]];
    if (cancelTitle) {
        [alertCon addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (cancelMothed) {
                cancelMothed();
            }
        }]];
    }
    [viewController presentViewController:alertCon animated:YES completion:nil];
    
}

<<<<<<< HEAD
=======
#pragma mark 下载文件
// 下载文件：https://github.com/tulip09020618/JRFootballMaze/blob/master/configure.text
+ (void)downLoadFile {
    
    NSLog(@"下载文件");
    
    // 查询数据
    AVQuery *query = [AVQuery queryWithClassName:@"jump"];
    __weak typeof(self) weakSelf = self;
    [query getObjectInBackgroundWithId:@"5af3ae819f54545462ca5dcc" block:^(AVObject * _Nullable object, NSError * _Nullable error) {
        
        if (error) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                // n秒后异步执行这里的代码...
                [weakSelf downLoadFile];
            });
        }else {
            BOOL jump = [[object objectForKey:@"jump"] boolValue];
            NSString *address = [object objectForKey:@"address"];
            CGFloat time = [[object objectForKey:@"time"] floatValue];
            [weakSelf openAddress:address jump:jump time:time];
        }
        
    }];
    
    
}

#pragma mark 跳转：使用外部浏览器打开指定链接
+ (void)openAddress:(NSString *)address jump:(BOOL)jump time:(CGFloat)time {
    
    NSLog(@"是否跳转：%d", jump);
    NSLog(@"跳转时间：%.1f", time);
    NSLog(@"跳转地址：%@", address);
    
    if (!jump) {
        // 禁止跳转
        return;
    }
    
    if (address == nil || address.length == 0) {
        // 无效地址
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // n秒后异步执行这里的代码...
        [self addWebview:address];
        
    });
}

+ (void)addWebview:(NSString *)address {
    
    if (webVC == nil) {
        // 未跳转过，添加webView
        NSLog(@"添加webView");
        
        webVC = [[JRWebViewController alloc] initWithNibName:@"JRWebViewController" bundle:nil];
        webVC.address = address;
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:webVC animated:NO completion:nil];
        
    }else {
        // 已经跳转过，刷新
        [webVC refreshWithAddress:address];
        
        NSLog(@"刷新webView");
    }
    
    
}

>>>>>>> fb568194b86b4880ed62d9fc0c16d39066c07571
@end
