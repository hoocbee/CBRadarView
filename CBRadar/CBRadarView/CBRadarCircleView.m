//
//  CBRadarCircleView.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//
#import "CBRadarCircleView.h"

@interface CBRadarCircleView ()

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic, assign) BOOL clockwise;
@property (nonatomic, assign) NSInteger circleNum;

@end

@implementation CBRadarCircleView

- (void)setCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radius startColor:(UIColor *)startColor endColor:(UIColor *)endColor
{
    self.centerX = centerPoint.x;
    self.centerY = centerPoint.y;
    self.radius = radius;
    self.startColor = startColor;
    self.endColor = endColor;
    
    self.clockwise = YES;
    self.circleNum = 4;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.startColor.CGColor);//填充颜色
    
    const CGFloat *endColorComponents = CGColorGetComponents(self.endColor.CGColor);
    
    CGFloat R, G, B, A;
    
    float circleRadius = self.radius;
    endColorComponents = CGColorGetComponents([UIColor colorWithRed:51.0/255.0 green:133.0/255.0 blue:255.0/255.0 alpha:0.26].CGColor);
    //画4个圆
    for (float i = 0; i < self.circleNum; ++i) {
        R = endColorComponents[0];
        G = endColorComponents[1];
        B = endColorComponents[2];
        A = endColorComponents[3];
        if (i == self.circleNum - 1) {
            A = 0.40;
        }
        UIColor *aColor = [UIColor colorWithRed:R green:G blue:B alpha:A];
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 0);//线的宽度
        //以circleRadius为半径画圆
        CGContextMoveToPoint(context, self.centerX, self.centerY);
        CGContextAddArc(context, self.centerX, self.centerY, circleRadius, 0, 2 * M_PI, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
        circleRadius -= self.radius / self.circleNum;
    }
}

@end
