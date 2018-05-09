//
//  JRWebViewController.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/5/9.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRWebViewController.h"
#import <WebKit/WebKit.h>

@interface JRWebViewController ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) CALayer *progressLayer;

@end

@implementation JRWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGFloat webY = 20;
    if (IS_IPHONE_X) {
        webY = 44;
    }
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, webY, SCREEN_WIDTH, SCREEN_HEIGHT-webY)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.address]];
    [webView loadRequest:request];
    // kvo监听，获取加载进度
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:webView];
    self.webView = webView;
    
    //创建进度条
    [self createProgressView];
}

#pragma mark 创建进度条(为什么要用CALayer？隐式动画)
- (void)createProgressView {
    CGFloat progressY = 20;
    if (IS_IPHONE_X) {
        progressY = 44;
    }
    
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, progressY, CGRectGetWidth(self.view.frame), 3)];
    progress.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = [UIColor colorWithHex:0xff5f32].CGColor;
    [progress.layer addSublayer:layer];
    self.progressLayer = layer;
}

#pragma mark 监听加载进度
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSLog(@"keyPath:%@, change:%@, context:%@", keyPath, change, context);
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        self.progressLayer.opacity = 1;
        //不要让进度条倒着走...有时候goback会出现这种情况
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progressLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressLayer.opacity = 0;
            });
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressLayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }else{
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)refreshWithAddress:(NSString *)address {
    if (address == nil || address.length == 0) {
        return;
    }
    
    if ([self.address isEqualToString:address]) {
        // 同样的地址，不做处理
        return;
    }
    
    self.address = address;
    
    NSURL *url = [NSURL URLWithString:address];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

@end
