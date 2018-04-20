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

- (IBAction)reSet:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 生成迷宫
    JRMazeView *mazeView = [[JRMazeManager manager] generateMazeWithRows:30 withCols:30 withSpace:10];
    mazeView.center = self.view.center;
    [self.view addSubview:mazeView];
    self.mazeView = mazeView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)reSet:(id)sender {
    
    [self.mazeView removeFromSuperview];
    
    // 生成迷宫
    JRMazeView *mazeView = [[JRMazeManager manager] generateMazeWithRows:30 withCols:30 withSpace:10];
    mazeView.center = self.view.center;
    [self.view addSubview:mazeView];
    self.mazeView = mazeView;
}
@end
