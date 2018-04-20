//
//  JRMazeCellModel.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRMazeCellModel.h"

@implementation JRMazeCellModel

- (instancetype)initWithRow:(NSInteger)row withCol:(NSInteger)col {
    if (self = [super init]) {
        self.row = row;
        self.col = col;
        self.canLeft = NO;
        self.canUp = NO;
        self.canRight = NO;
        self.canDown = NO;
    }
    return self;
}

#pragma mark 开启某个方向，使某个方向可以移动
- (void)openDirection:(DIRECTION_TYPE)direction {
    switch (direction) {
        case DIRECTION_TYPE_LEFT:
            self.canLeft = YES;
            break;
        case DIRECTION_TYPE_UP:
            self.canUp = YES;
            break;
        case DIRECTION_TYPE_RIGHT:
            self.canRight = YES;
            break;
        case DIRECTION_TYPE_DOWN:
            self.canDown = YES;
            break;
            
        default:
            break;
    }
}

@end
