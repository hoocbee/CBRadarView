# CBRadarView

简单易用的雷达扫描控件

  //创建
  CBRadarView *radarView = [[CBRadarView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
  [self.view addSubview:self.radarView];
  //开始扫描
  [self.radarView startAnimation];
  //停止扫描
  [self.radarView stopAnimation];
