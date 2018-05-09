//
//  ViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "ViewController.h"
#import "JRSelectLevelViewController.h"
#import "JRLevelDetailsViewController.h"
#import "JRRulesIntroductionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

#pragma mark 闯关模式
- (IBAction)levelMode:(id)sender {
    JRSelectLevelViewController *levelVC = [[JRSelectLevelViewController alloc] initWithNibName:@"JRSelectLevelViewController" bundle:nil];
    [self presentViewController:levelVC animated:NO completion:nil];
}

#pragma mark 随机模式
- (IBAction)randomMode:(id)sender {
    JRLevelDetailsViewController *detailsVC = [[JRLevelDetailsViewController alloc] initWithNibName:@"JRLevelDetailsViewController" bundle:nil];
    detailsVC.type = MODE_TYPE_RANDOM;
    [self presentViewController:detailsVC animated:NO completion:nil];
}

#pragma mark 规则介绍
- (IBAction)rulesIntroduction:(id)sender {
    JRRulesIntroductionViewController *rulesVC = [[JRRulesIntroductionViewController alloc] initWithNibName:@"JRRulesIntroductionViewController" bundle:nil];
    [self presentViewController:rulesVC animated:YES completion:nil];
}

@end
