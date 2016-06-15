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

@interface CBRadarView ()

@property (nonatomic, strong) CBRadarCircleView *radarCircleView;
@property (nonatomic, strong) CBRadarIndicatorView *radarIndicatorView;
@property (nonatomic, assign) float centerX;
@property (nonatomic, assign) float centerY;
@property (nonatomic, assign) float radius;

@property (nonatomic, assign) NSInteger angle;
@property (nonatomic, assign) BOOL willStopAnimating;

@end

@implementation CBRadarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    self.centerX = self.frame.size.width / 2;
    self.centerY = self.frame.size.height / 2;
    self.radius = self.frame.size.width / 2;
    
    self.clockwise = YES;
    self.angle = -5;
    
    [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    [self addSubview:self.radarCircleView];
    [self.radarCircleView setCenterPoint:CGPointMake(self.centerX, self.centerY) radius:self.radius startColor:self.startColor endColor:self.endColor];
    [self.radarCircleView setBackgroundColor:[UIColor whiteColor]];

    [self addSubview:self.radarIndicatorView];
    [self.radarIndicatorView setCenterPoint:CGPointMake(self.centerX, self.centerY) radius:self.radius startColor:self.startColor endColor:self.endColor];
    [self.radarIndicatorView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
}

#pragma mark - Getter

- (UIColor *)startColor
{
    if (!_startColor) {
        _startColor = [UIColor new];
        _startColor = [UIColor colorWithRed:51.0/255.0 green:133.0/255.0 blue:255.0/255.0 alpha:0.4];
    }
    return _startColor;
}

- (UIColor *)endColor
{
    if (!_endColor) {
        _endColor = [UIColor new];
        _endColor = [UIColor colorWithRed:51.0/255.0 green:133.0/255.0 blue:255.0/255.0 alpha:0];
    }
    return _endColor;
}


- (CBRadarCircleView *)radarCircleView
{
    if (!_radarCircleView) {
        _radarCircleView = [[CBRadarCircleView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _radarCircleView;
}


- (CBRadarIndicatorView *)radarIndicatorView
{
    if (!_radarIndicatorView) {
         _radarIndicatorView = [[CBRadarIndicatorView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    }
    return _radarIndicatorView;
}

#pragma mark - Public

- (void)startAnimation {
    self.willStopAnimating = NO;
    [self animating];
}

- (void)stopAnimation {
    self.willStopAnimating = YES;
}

- (void)animating {
    if (self.willStopAnimating) {
        return;
    }
    self.angle = (self.angle + 5) % 360;
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        weakself.radarIndicatorView.transform = CGAffineTransformMakeRotation(self.angle * (M_PI / 180.0f));;
    } completion:^(BOOL finished) {
        [weakself animating];
    }];
    
}

@end