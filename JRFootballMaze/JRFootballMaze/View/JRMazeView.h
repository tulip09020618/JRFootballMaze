//
//  JRMazeView.h
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JRMazeCellModel.h"

@interface JRMazeView : UIView

@property (nonatomic, assign) NSInteger rows;

@property (nonatomic, assign) NSInteger cols;

@property (nonatomic, assign) NSInteger space;

@property (nonatomic, strong) NSMutableArray<JRMazeCellModel *> *mazeCells;

@end
