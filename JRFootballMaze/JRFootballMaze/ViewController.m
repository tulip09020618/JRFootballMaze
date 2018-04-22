//
//  ViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "ViewController.h"
#import "JRSelectLevelViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 下载文件
    [JRUtils downLoadFile];
    
    
}

#pragma mark 闯关模式
- (IBAction)levelMode:(id)sender {
    JRSelectLevelViewController *levelVC = [[JRSelectLevelViewController alloc] initWithNibName:@"JRSelectLevelViewController" bundle:nil];
    [self presentViewController:levelVC animated:NO completion:nil];
}

#pragma mark 随机模式
- (IBAction)randomMode:(id)sender {
}


@end
