//
//  DBIHomeViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeViewController.h"
#import "DBIListViewController.h"
#import "Masonry.h"
#import "DBIHomePageManager.h"

@interface DBIHomeViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *hotActivityIndicator;

@end

@implementation DBIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _homeView = [[DBIHomeView alloc] init];
    [self.view addSubview:_homeView];
    [_homeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    [_homeView.homeButton addTarget:self action:@selector(allMoview) forControlEvents:UIControlEventTouchUpInside];
    
    _hotActivityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_homeView addSubview:_hotActivityIndicator];
    [_hotActivityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.homeView);
    }];
    _hotActivityIndicator.hidesWhenStopped = YES;
    [_hotActivityIndicator startAnimating];
    [self hotNetwork];
}

- (void)allMoview {
    DBIListViewController *listViewController = [[DBIListViewController alloc] init];
    listViewController.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBarHidden = NO;
    listViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    //隐藏导航栏底部分界线
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navImage"] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)hotNetwork {
    [[DBIHomePageManager sharedManager] hotNetworkRequestSuccess:^(DBIHomeModel * _Nonnull homeModel) {
        self.hotHomeModel = homeModel;
        DBISubjectsModel *subjects = homeModel.subjects[0];
        NSLog(@"%@", subjects.title);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (DBIHomeHotButton *button in self->_homeView.hotView.hotButtonArray) {
                DBISubjectsModel *subjects = self.hotHomeModel.subjects[button.tag];
                button.hotStarView.starScore = subjects.rating.average;
                button.hotNameLabel.text = subjects.title;
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:subjects.images.small]];
                button.hotImageView.image = [UIImage imageWithData:data];
                [button.hotStarView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(button.hotNameLabel.mas_bottom).offset(5);
                    make.left.equalTo(button);
                    make.width.equalTo(button.hotImageView.mas_width);
                    make.height.equalTo(@(10));
                }];
                button.hotStarView.starScore = subjects.rating.average;
            }
            [self.hotActivityIndicator stopAnimating];
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
    }];
}

- (void)willNetwork {
    [[DBIHomePageManager sharedManager] willNetworkRequestSuccess:^(DBIHomeModel * _Nonnull homeModel) {
        self.willHomeModel = homeModel;
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            
            
            
            
            
            
            
            
            
            
            
            
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
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
