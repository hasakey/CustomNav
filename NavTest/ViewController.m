//
//  ViewController.m
//  NavTest
//
//  Created by 喂！ on 2018/12/11.
//  Copyright © 2018年 well. All rights reserved.
//

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define topViewH 200
#define headMinH 64

#import "ViewController.h"
#import "UIImage+colorToImg.h"
#import "TopView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *mainTable;

@property(nonatomic,strong)UILabel *nameLabel;

@property(nonatomic,strong)TopView *topView;

@property (nonatomic, assign) CGFloat lastOffsetY;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor redColor];
    [self setUpSubViews];
    self.lastOffsetY = -topViewH;

}

-(void)setUpSubViews
{
    self.nameLabel.text = @"个人主页";
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = self.nameLabel;
    self.nameLabel.alpha = 0;
    [self.view addSubview:self.mainTable];
    self.mainTable.frame = CGRectMake(0, 0,SCREEN_WIDTH , SCREENH_HEIGHT);
    self.mainTable.contentInset = UIEdgeInsetsMake(topViewH, 0, 0, 0);
    [self.view addSubview:self.topView];
    self.topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, topViewH);
    
    // 给导航条的背景图片传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏底部阴影条，传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID
                ];
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    NSLog(@"offsetY -- %f",offsetY);
    
    CGFloat delta = offsetY - self.lastOffsetY;
    
    NSLog(@"delta -- %f",delta);
    
    // 往上拖动，高度减少。
    CGFloat height = topViewH - delta;
    
    NSLog(@"height -- %f",height);
    
    if (height < headMinH) {
        height = headMinH;
    }
    self.topView.frame = CGRectMake(self.topView.frame.origin.x, self.topView.frame.origin.y, self.topView.frame.size.width, height);
    
    // 设置导航条的背景图片
    CGFloat alpha = delta / (topViewH - headMinH);
    
    // 当alpha大于1，导航条半透明，因此做处理，大于1，就直接=0.99
    if (alpha >= 1) {
        alpha = 0.99;
    }
    // 设置导航条的背景图片
    self.nameLabel.alpha = alpha;
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

#pragma mark    懒加载
-(UITableView *)mainTable
{
    if (!_mainTable) {
        _mainTable = [UITableView new];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
    }
    return _mainTable;
}

-(UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
    }
    return _nameLabel;
}

-(TopView *)topView
{
    if (!_topView) {
        _topView = [TopView new];
    }
    return _topView;
}


@end
