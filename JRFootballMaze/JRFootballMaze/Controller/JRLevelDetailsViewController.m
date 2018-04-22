//
//  JRLevelDetailsViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRLevelDetailsViewController.h"
#import "JRMazeManager.h"

@interface JRLevelDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIView *mazeBackView;

@property (nonatomic, strong) JRMazeView *mazeView;

/**
 计时器，按住按钮时，0.2s执行一次移动操作
 */
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation JRLevelDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = [NSString stringWithFormat:@"第%ld关", self.levelIndex + 1];
    
    // 生成迷宫
    // 迷宫行数，列数，每个间隔大小
    NSInteger row = 10;
    
    // 根据关卡数设置难度等级
    //  1 - 10: 简单
    // 11 - 20: 中等
    // 21 - 30: 最难
    if (self.levelIndex >= 10 && self.levelIndex < 20) {
        row = 15;
    }else if (self.levelIndex >= 20) {
        row = 20;
    }
    
    // 迷宫列数
    NSInteger col = row;
    // 迷宫每个间隔大小
    CGFloat space = (CGRectGetWidth(self.mazeBackView.frame) - 20) / col;
    
    JRMazeView *mazeView = [[JRMazeManager manager] generateMazeWithRows:row withCols:col withSpace:space];
    mazeView.center = CGPointMake(CGRectGetWidth(self.mazeBackView.frame) / 2.0, CGRectGetHeight(self.mazeBackView.frame) / 2.0);
    [self.mazeBackView addSubview:mazeView];
    self.mazeView = mazeView;
    
    [JRMazeManager manager].success = ^{
        // 通关
        [self win];
    };
}

- (IBAction)move:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSInteger index = btn.tag - 100;
    
    [self.view bringSubviewToFront:btn];
    
    if (index == 0) {
        // 向左移动
        [[JRMazeManager manager] left];
    }else if (index == 1) {
        // 向上移动
        [[JRMazeManager manager] up];
    }else if (index == 2) {
        // 向右移动
        [[JRMazeManager manager] right];
    }else if (index == 3) {
        // 向下移动
        [[JRMazeManager manager] down];
    }
    
    if (@available(iOS 10.0, *)) {
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            if (index == 0) {
                // 向左移动
                [[JRMazeManager manager] left];
            }else if (index == 1) {
                // 向上移动
                [[JRMazeManager manager] up];
            }else if (index == 2) {
                // 向右移动
                [[JRMazeManager manager] right];
            }else if (index == 3) {
                // 向下移动
                [[JRMazeManager manager] down];
            }
        }];
    }
}

- (IBAction)stop:(id)sender {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark 通关
- (void)win {
    
    if (self.success) {
        self.success(self.levelIndex);
    }
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    [JRUtils showAlertViewWithTitle:@"通关" withMessage:@"恭喜，您已顺利通过此关。" withActionTitle:@"确定" withActionMothed:^{
        [self goback:nil];
    } withCancelTitle:nil withCancelMothed:nil withViewController:self];
}

#pragma mark 返回
- (IBAction)goback:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
