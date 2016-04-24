//
//  CBRadarView.h
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CBRadarView : UIView


@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;

- (void)setup;
- (void)startAnimation;
- (void)stopAnimation;

@end
