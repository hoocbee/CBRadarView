//
//  ViewController.m
//  CBRadar
//
//  Created by baidu on 16/4/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "CBRadarView.h"

@interface ViewController ()

@property (nonatomic, strong) CBRadarView *radarView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.radarView = [[CBRadarView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    [self.view addSubview:self.radarView];
    
    [self.radarView startAnimation];
    //[self.radarView stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
