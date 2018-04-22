//
//  JRSelectLevelViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/21.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRSelectLevelViewController.h"
#import "JRLevelDetailsViewController.h"

// 每个关卡间的距离
static CGFloat space = 10;
// 关卡总数量
static NSInteger levelCount = 30;

@interface JRSelectLevelViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation JRSelectLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 添加关卡
    [self addLevelToScrollView];
}

- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark 生成一个关卡视图
- (UIView *)generateLevelViewWithIndex:(NSInteger)index {
    
    CGFloat backW = (SCREEN_WIDTH - 10 * 5) / 4.0;
    CGFloat backH = backW;
    
    // 背景
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, backW, backH)];
    backView.layer.cornerRadius = 10;
    backView.layer.masksToBounds = YES;
    backView.backgroundColor = [UIColor lightGrayColor];
    
    // 背景图片
    UIImageView *backImgView = [[UIImageView alloc] initWithFrame:backView.bounds];
    backImgView.image = [UIImage imageNamed:@"levelBack.jpeg"];
    [backView addSubview:backImgView];
    
    // 关卡
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(0, 0, backW, backH)];
    [btn setTitle:[NSString stringWithFormat:@"%ld", index + 1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.tag = 200 + index;
    [btn addTarget:self action:@selector(selectLevel:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:btn];
    
    // 锁定
    // 获取当前关卡数
    NSInteger currentLevelIndex = [JRUserDefaultsManager getCurrentLevel];
    // index:从0开始 currentlevelIndex:从1开始
    if (index + 1 > currentLevelIndex) {
        // 关卡大于当前关卡，则为锁定状态
        UIView *lockBackView = [[UIView alloc] initWithFrame:backView.bounds];
        lockBackView.backgroundColor = [UIColor colorWithHex:0x000000 andAlpha:0.3];
        lockBackView.tag = 300 + index;
        [backView addSubview:lockBackView];
        UIImageView *lockImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 32, 32)];
        lockImgView.image = [UIImage imageNamed:@"selectLevel_lock"];
        [lockBackView addSubview:lockImgView];
    }
    
    return backView;
}

#pragma mark 添加关卡
- (void)addLevelToScrollView {
    
    // 每页放16个关卡，计算一共有几页
    NSInteger page = ceil(levelCount / 16.0);
    
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * page, SCREEN_WIDTH);
    
    for (NSInteger i = 0; i < levelCount; i ++) {
        UIView *levelView = [self generateLevelViewWithIndex:i];
        CGRect levelRect = levelView.frame;
        // 当前所在页数
        NSInteger currentPage = i / 16;
        // 当前所在行
        NSInteger row = i / 4 % 4;
        // 当前所在列
        NSInteger col = i % 4;
        levelRect.origin = CGPointMake(SCREEN_WIDTH * currentPage + space + (space + levelRect.size.width) * col, space + (space + levelRect.size.height) * row);
        levelView.frame = levelRect;
        [self.scrollView addSubview:levelView];
    }
}

#pragma mark 选择关卡
- (void)selectLevel:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSInteger levelIndex = btn.tag - 200;
    
    JRLevelDetailsViewController *detailsVC = [[JRLevelDetailsViewController alloc] initWithNibName:@"JRLevelDetailsViewController" bundle:nil];
    detailsVC.type = MODE_TYPE_LEVEL;
    detailsVC.levelIndex = levelIndex;
    __weak typeof(self) weakSelf = self;
    detailsVC.success = ^(NSInteger levelIndex) {
        // 闯关成功
        [weakSelf unLockNextLevel:levelIndex+1];
    };
    [self presentViewController:detailsVC animated:NO completion:nil];
}

#pragma mark 解锁下一关
- (void)unLockNextLevel:(NSInteger)nextLevelIndex {
    
    // 先判断下一关是否为锁定状态
    // 获取下一关锁定视图
    UIView *lockBackView = [self.view viewWithTag:300 + nextLevelIndex];
    if (lockBackView == nil) {
        // 下一关为解锁状态，无需任何操作
        return;
    }
    
    // 下一关为锁定状态，解锁下一关
    [lockBackView removeFromSuperview];
    
    // 记录最新一关
    [JRUserDefaultsManager saveCurrentLevel:nextLevelIndex + 1];
    
}

@end
