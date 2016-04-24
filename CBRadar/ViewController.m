//
//  ViewController.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"
#import "CBRadarView.h"

@interface ViewController () {
    CBRadarView *radarView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    radarView = [[CBRadarView alloc]init];
    [self.view addSubview:radarView];
    [radarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.height.equalTo(@200);
        make.width.equalTo(radarView.mas_height);
    }];
    
    [radarView setup];
    [radarView startAnimation];
    
    /*停止动画和开始动画测试*/
    [radarView performSelector:@selector(stopAnimation) withObject:nil afterDelay:2.0];
    [radarView performSelector:@selector(startAnimation) withObject:nil afterDelay:4.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
