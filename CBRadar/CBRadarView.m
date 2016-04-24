//
//  CBRadarView.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "CBRadarView.h"
#import "CBRadarIndicatorView.h"
#import "CBRadarCircleView.h"

@interface CBRadarView () {
    CBRadarIndicatorView *radarIndicatorView;
    CBRadarCircleView *radarCircleView;
    CGFloat centerX, centerY, radius;
    int angle;
    BOOL willStopAnimating;
}

@end

@implementation CBRadarView

- (void)setup {
    [self setNeedsLayout];
    [self layoutIfNeeded];
    NSLog(@"h: %f, w: %f", self.frame.size.height, self.frame.size.width);
    
    if (!_startColor) {
        _startColor = [UIColor colorWithRed:0.0/255.0 green:130.0/255.0 blue:255.0/255.0 alpha:1.0];
    }
    if (!_endColor) {
        _endColor = [UIColor colorWithRed:0.0/255.0 green:180.0/255.0 blue:255.0/255.0 alpha:0];
    }
    centerX = self.frame.size.width / 2;
    centerY = self.frame.size.height / 2;
    radius = self.frame.size.width / 2;
    angle = -5;
    
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    radarCircleView = [[CBRadarCircleView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [radarCircleView setCenterPoint:CGPointMake(centerX, centerY) radius:radius startColor:_startColor endColor:_endColor];
    [radarCircleView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:radarCircleView];
    
    radarIndicatorView = [[CBRadarIndicatorView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [radarIndicatorView setCenterPoint:CGPointMake(centerX, centerY) radius:radius startColor:_startColor endColor:_endColor];
    [radarIndicatorView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    [self addSubview:radarIndicatorView];
    
}

- (void)animating {
    if (willStopAnimating) {
        return;
    }
    angle = (angle + 5) % 360;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        radarIndicatorView.transform = CGAffineTransformMakeRotation(angle * (M_PI / 180.0f));;
    } completion:^(BOOL finished) {
        NSLog(@"angle = %d", angle);
        [self animating];
    }];
    
}

- (void)startAnimation {
    willStopAnimating = NO;
    [self animating];
}

- (void)stopAnimation {
    willStopAnimating = YES;
}

@end