//
//  CBRadarCircleView.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//
#import "CBRadarCircleView.h"

@implementation CBRadarCircleView {
    CGFloat centerX, centerY, radius;
    UIColor *startColor, *endColor;
    BOOL clockwise;
    int circleNum;
}

- (void)setCenterPoint:(CGPoint)centerPoint radius:(CGFloat)aRadius startColor:(UIColor *)aStartColor endColor:(UIColor *)anEndColor {
    centerX = centerPoint.x;
    centerY = centerPoint.y;
    radius = aRadius;
    startColor = aStartColor;
    endColor = anEndColor;
    
    clockwise = YES;
    circleNum = 4;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, startColor.CGColor);//填充颜色
    
    const CGFloat *startColorComponents = CGColorGetComponents(startColor.CGColor);
    const CGFloat *endColorComponents = CGColorGetComponents(endColor.CGColor);
    
    CGFloat R, G, B, A;
    
    float circleRadius = radius;
    endColorComponents = CGColorGetComponents([UIColor colorWithRed:0.0/255.0 green:230.0/255.0 blue:255.0/255.0 alpha:0.5].CGColor);
    //画4个圆
    for (float i = 0; i < circleNum; ++i) {
        CGFloat ratio = (circleNum - i) / circleNum;
        R = startColorComponents[0] - (startColorComponents[0] - endColorComponents[0])*ratio;
        G = startColorComponents[1] - (startColorComponents[1] - endColorComponents[1])*ratio;
        B = startColorComponents[2] - (startColorComponents[2] - endColorComponents[2])*ratio;
        A = startColorComponents[3] - (startColorComponents[3] - 0.5)*ratio;
        UIColor *aColor = [UIColor colorWithRed:R green:G blue:B alpha:A];
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 0);//线的宽度
        //以circleRadius为半径画圆
        CGContextMoveToPoint(context, centerX, centerY);
        CGContextAddArc(context, centerX, centerY, circleRadius, 0, 2 * M_PI, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
        circleRadius -= radius / circleNum;
    }
}

@end
