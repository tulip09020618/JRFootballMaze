//
//  JRMazeView.m
//  JRFootballMaze
//
//  Created by hqtech on 2018/4/20.
//  Copyright © 2018年 tulip. All rights reserved.
//

#import "JRMazeView.h"

@implementation JRMazeView

- (void)drawRect:(CGRect)rect {
    
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //设置填充颜色
    CGContextSetFillColorWithColor(context, [UIColor blackColor].CGColor);
    
    // 指定直线样式
    CGContextSetLineCap(context, kCGLineCapButt);
    
    // 设置直线宽度
    CGContextSetLineWidth(context, 1.0);
    
    // 开始绘制
    CGContextBeginPath(context);
    
    // 根据生成的迷宫数据绘制迷宫图
    for (NSInteger i = 0; i < self.mazeCells.count; i ++) {
        JRMazeCellModel *cell = self.mazeCells[i];
        
        if (!cell.canLeft) {
            // 绘制左边直线

            // 将画笔移动到左上角
            CGContextMoveToPoint(context, cell.col * self.space, cell.row * self.space);
            // 画一条直线到左下角
            CGContextAddLineToPoint(context, cell.col * self.space, (cell.row + 1) * self.space);
        }
        if (!cell.canUp) {
            // 绘制上边直线
            
            // 将画笔移动到左上角
            CGContextMoveToPoint(context, cell.col * self.space, cell.row * self.space);
            // 画一条直线到右上角
            CGContextAddLineToPoint(context, (cell.col + 1) * self.space, cell.row * self.space);
        }
        if (!cell.canRight) {
            // 绘制右边直线
            
            // 将画笔移动到右上角
            CGContextMoveToPoint(context, (cell.col + 1) * self.space, cell.row * self.space);
            // 画一条直线到右下角
            CGContextAddLineToPoint(context, (cell.col + 1) * self.space, (cell.row + 1) * self.space);
        }
        if (!cell.canDown) {
            // 绘制下边直线
            
            // 将画笔移动到左下角
            CGContextMoveToPoint(context, cell.col * self.space, (cell.row + 1) * self.space);
            // 画一条直线到右下角
            CGContextAddLineToPoint(context, (cell.col + 1) * self.space, (cell.row + 1) * self.space);
        }
    }
    
    // 绘制完成
    CGContextStrokePath(context);
}

@end
