//
//  CBRadarIndicatorView.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "CBRadarIndicatorView.h"

@implementation CBRadarIndicatorView {
    CGFloat centerX, centerY, radius;
    UIColor *startColor, *endColor;
    BOOL clockwise;
}

- (void)setCenterPoint:(CGPoint)centerPoint radius:(CGFloat)aRadius startColor:(UIColor *)aStartColor endColor:(UIColor *)anEndColor {
    centerX = centerPoint.x;
    centerY = centerPoint.y;
    radius = aRadius;
    startColor = aStartColor;
    endColor = anEndColor;
    
    clockwise = YES;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, startColor.CGColor);//填充颜色

    const CGFloat *startColorComponents = CGColorGetComponents(startColor.CGColor);
    const CGFloat *endColorComponents = CGColorGetComponents(endColor.CGColor);
    
    CGFloat R, G, B, A;
    float angle = 180;
    for (int i = 0; i<= angle; ++i) {
        CGFloat ratio = (angle - i)/angle;
        R = startColorComponents[0] - (startColorComponents[0] - endColorComponents[0])*ratio;
        G = startColorComponents[1] - (startColorComponents[1] - endColorComponents[1])*ratio;
        B = startColorComponents[2] - (startColorComponents[2] - endColorComponents[2])*ratio;
        A = startColorComponents[3] - (startColorComponents[3] - endColorComponents[3])*ratio;
        //画扇形
        UIColor *aColor = [UIColor colorWithRed:R green:G blue:B alpha:A];
        
        CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
        CGContextSetLineWidth(context, 0);//线的宽度
        //以self.radius为半径围绕圆心画指定角度扇形
        CGContextMoveToPoint(context, centerX, centerY);
        CGContextAddArc(context, centerX, centerY, radius,  (i + angle) * M_PI / 180, (i + angle - 1) * M_PI / 180, clockwise);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    }
    
    
}


@end