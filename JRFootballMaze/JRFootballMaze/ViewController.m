//
//  ViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "ViewController.h"
#import "JRMazeManager.h"

@interface ViewController ()

@property (nonatomic, strong) JRMazeView *mazeView;

/**
 计时器，按住按钮时，0.2s执行一次移动操作
 */
@property (nonatomic, strong) NSTimer *timer;

- (IBAction)reSet:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 下载文件
    [JRUtils downLoadFile];
    
    // 生成迷宫
    JRMazeView *mazeView = [[JRMazeManager manager] generateMazeWithRows:20 withCols:20 withSpace:15];
    mazeView.center = self.view.center;
    [self.view addSubview:mazeView];
    self.mazeView = mazeView;
    
    [JRMazeManager manager].success = ^{
        // 通关
        [self win];
    };
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reSet:(id)sender {
    
    [self.mazeView removeFromSuperview];
    
    // 生成迷宫
    JRMazeView *mazeView = [[JRMazeManager manager] generateMazeWithRows:20 withCols:20 withSpace:15];
    mazeView.center = self.view.center;
    [self.view addSubview:mazeView];
    self.mazeView = mazeView;
}

- (IBAction)move:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSInteger index = btn.tag - 100;
    
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
    
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    
    [JRUtils showAlertViewWithTitle:@"通关" withMessage:@"恭喜，您已顺利通过此关。" withActionTitle:@"重置" withActionMothed:^{
        [self reSet:nil];
    } withCancelTitle:nil withCancelMothed:nil withViewController:self];
}

@end
