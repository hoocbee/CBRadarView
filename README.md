# CBRadarView

简单易用的雷达扫描控件

//创建 <br />
CBRadarView *radarView = [[CBRadarView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)]; <br />
[self.view addSubview:self.radarView]; <br />
//开始扫描 <br />
[self.radarView startAnimation]; <br />
//停止扫描 <br />
[self.radarView stopAnimation]; <br />
