//
//  CBRadarIndicatorView.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "CBRadarIndicatorView.h"

@interface CBRadarIndicatorView ()

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) BOOL clockwise;
@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;

@end

@implementation CBRadarIndicatorView

- (void)setCenterPoint:(CGPoint)centerPoint radius:(CGFloat)aRadius startColor:(UIColor *)aStartColor endColor:(UIColor *)anEndColor
{
    self.centerX = centerPoint.x;
    self.centerY = centerPoint.y;
    self.radius = aRadius;
    self.startColor = aStartColor;
    self.endColor = anEndColor;
    
    self.clockwise = YES;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.startColor.CGColor);//填充颜色

    const CGFloat *startColorComponents = CGColorGetComponents(self.startColor.CGColor);
    const CGFloat *endColorComponents = CGColorGetComponents(self.endColor.CGColor);
    
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
        CGContextMoveToPoint(context, self.centerX, self.centerY);
        CGContextAddArc(context, self.centerX, self.centerY, self.radius,  (i + angle) * M_PI / 180, (i + angle - 1) * M_PI / 180, self.clockwise);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    }
}


@end