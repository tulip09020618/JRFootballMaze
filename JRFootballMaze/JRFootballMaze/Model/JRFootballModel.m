//
//  JRFootballModel.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRFootballModel.h"

@implementation JRFootballModel

- (instancetype)initWithRow:(NSInteger)row withCol:(NSInteger)col {
    if (self = [super init]) {
        self.row = row;
        self.col = col;
    }
    return self;
}

@end
