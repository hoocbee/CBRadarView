//
//  CBRadarIndicatorView.h
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBRadarIndicatorView : UIView

- (void)setCenterPoint:(CGPoint)centerPoint radius:(CGFloat)radius startColor:(UIColor *)startColor endColor:(UIColor *)endColor;

@end