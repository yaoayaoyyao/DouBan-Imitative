//
//  DBIDetailViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailViewController.h"
#import "Masonry.h"

@interface DBIDetailViewController ()

@property UILabel *mainTitle;

@end

@implementation DBIDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:self.view.backgroundColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:_backView];

    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left_arrow.png"] style:UIBarButtonItemStyleDone target:self action:@selector(ClickleftBarButton)];
    [leftBarButtonItem setTintColor:[UIColor whiteColor]];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    _detailView = [[DBIDetailView alloc] init];
    [self.view addSubview:_detailView];
    [_detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollDown) name:@"scrollDown" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollUp) name:@"scrollUp" object:nil];
    [self detailNetWork];
}

- (void)viewWillAppear:(BOOL)animated {
    _headView = [[DBIDetailHeadView alloc] init];
    _headView.frame = CGRectMake(55, 7, 185, 40);
    _headView.alpha = 0;
    _headView.clipsToBounds = YES;
    _headView.movieStarView.starScore = 6.8;
    _headView.movieStarView.frame = CGRectMake( 35, 20, 150, 15);
    _mainTitle = [[UILabel alloc] init];
    _mainTitle.text = @"电影";
    _mainTitle.textColor = [UIColor whiteColor];
    _mainTitle.font = [UIFont systemFontOfSize:17];
    _mainTitle.textAlignment = NSTextAlignmentCenter;
    _mainTitle.frame = CGRectMake(137, 10, 101, 20);
    [self.navigationController.navigationBar addSubview:_mainTitle];
    [self.navigationController.navigationBar addSubview:_headView];
}

- (void)ClickleftBarButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}



- (void)scrollDown {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame;
        frame = self.headView.frame;
        frame.origin.y -= 5;
        self.headView.frame = frame;
        self.headView.alpha = 1;
        frame = self.mainTitle.frame;
        frame.origin.y -= 5;
        self.mainTitle.frame = frame;
        self.mainTitle.alpha = 0;
    }];
    self.navigationController.navigationBar.clipsToBounds = NO;
}

- (void)scrollUp {
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame;
        frame = self.mainTitle.frame;
        frame.origin.y += 5;
        self.mainTitle.frame = frame;
        self.mainTitle.alpha = 1;
        frame = self.headView.frame;
        frame.origin.y += 5;
        self.headView.frame = frame;
        self.headView.alpha = 0;
    }];
    self.navigationController.navigationBar.clipsToBounds = YES;
}

- (void)detailNetWork {
    [[DBIDetailManager sharedManager] hotDetailNetworkWithID:_ID Success:^(DBIDetailModel * _Nonnull listHotIDModel) {
//        _detailView.titleDetailView.titleImageView.image = _movieImage;
//        _detailView.titleDetailView.nameTitleLabel.text = 
    } error:^(NSError * _Nonnull error) {
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
