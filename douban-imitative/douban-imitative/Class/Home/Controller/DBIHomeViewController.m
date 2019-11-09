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
#import "SOZOChromoplast.h"

@interface DBIHomeViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *hotActivityIndicator;
@property int flag;

@end

@implementation DBIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _flag = 0;
    
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
    [self willNetwork];
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
    self.navigationController.navigationBar.clipsToBounds = YES;
}

- (void)hotNetwork {
    [[DBIHomePageManager sharedManager] hotNetworkRequestSuccess:^(DBIHomeModel * _Nonnull homeModel) {
        self.hotHomeModel = homeModel;
        DBISubjectsModel *subjects = homeModel.subjects[0];
        NSLog(@"%@", subjects.title);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (DBIHomeHotButton *button in self->_homeView.hotView.hotButtonArray) {
                DBISubjectsModel *subjects = self.hotHomeModel.subjects[button.tag];
//                button.hotStarView.starScore = subjects.rating.average;
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
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickHotButton:) name:@"ClickHotButton" object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickWillButton:) name:@"ClickWillButton" object:nil];
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
    }];
}

- (void)willNetwork {
    [[DBIHomePageManager sharedManager] willNetworkRequestSuccess:^(DBIHomeModel * _Nonnull homeModel) {
        self.willHomeModel = homeModel;
        DBISubjectsModel *subjects = homeModel.subjects[0];
        NSLog(@"%@", subjects.title);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            for (DBIHomeWillButton *button in self->_homeView.willView.willButtonArray) {
                DBISubjectsModel *subjects = self.willHomeModel.subjects[button.tag];
                button.willNameLabel.text = subjects.title;
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:subjects.images.small]];
                button.willImageView.image = [UIImage imageWithData:data];
                
                NSString *month = [subjects.mainland_pubdate substringWithRange:NSMakeRange(5,2)];
                NSString *day = [subjects.mainland_pubdate substringWithRange:NSMakeRange(8,2)];
                button.willTimeLabel.text = [NSString stringWithFormat:@"%@月%@日", month, day];
//                button.willTimeLabel.alpha = 1;
                button.willTimeLabel.layer.borderWidth = 1;
                button.willTimeLabel.layer.borderColor = [[UIColor redColor]CGColor];
                //[button addSubview:button.willTimeLabel];
            }
            [self willNetWithID];
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
    }];
}

- (void)willNetWithID {
    for (DBIHomeWillButton *button in self->_homeView.willView.willButtonArray) {
        DBISubjectsModel *subjects = self.willHomeModel.subjects[button.tag];
        [[DBIHomePageManager sharedManager] willNetworkWithID:subjects.ID Success:^(DBIHomeWillModel * _Nonnull homeWillModel) {
            self.willModel = homeWillModel;
            NSLog(@"%@", subjects.ID);
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                button.willNumberLabel.text = [NSString stringWithFormat:@"%d人想看", self.willModel.wish_count];
                self->_flag++;
                if (self->_flag == 6) {
//                    [self.hotActivityIndicator stopAnimating];
                    [self hotNetwork];
                }
            }];
        } error:^(NSError * _Nonnull error) {
            NSLog(@"添加失败");
        }];
    }
}

- (void)ClickHotButton:(NSNotification *)noti {
    DBIHomeHotButton *btn = [noti object];
    DBISubjectsModel *subjects = _hotHomeModel.subjects[btn.tag];
    DBIDetailViewController *detailMovie = [[DBIDetailViewController alloc] init];
    detailMovie.ID = subjects.ID;
    detailMovie.movieImage = btn.hotImageView.image;
    SOZOChromoplast *chromoplast = [[SOZOChromoplast alloc] initWithImage:btn.hotImageView.image];
    self.navigationController.navigationBarHidden = NO;
    detailMovie.hidesBottomBarWhenPushed = YES;
    detailMovie.backView = [[UIView alloc] initWithFrame:self.view.frame];
    detailMovie.backView.alpha = 0.2;
    [self.navigationController pushViewController:detailMovie animated:YES];
    NSLog(@"%@", subjects.ID);
    
    CGFloat redValue, greenValue, blueValue, alphaValue;
    CGFloat rValue, gValue, bValue, alValue;
    [chromoplast.dominantColor getRed:&redValue green:&greenValue blue:&blueValue alpha:&alphaValue];
    [chromoplast.firstHighlight getRed:&rValue green:&gValue blue:&bValue alpha:&alValue];
    if ((redValue + greenValue + blueValue + alphaValue) > (rValue + gValue + bValue + alValue)) {
        detailMovie.view.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
        detailMovie.backView.backgroundColor = [UIColor colorWithRed:rValue green:gValue blue:bValue alpha:alValue];
    } else {
        detailMovie.backView.backgroundColor = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:alphaValue];
        detailMovie.view.backgroundColor = [UIColor colorWithRed:rValue green:gValue blue:bValue alpha:alValue];
    }
}
- (void)ClickWillButton:(NSNotification *)noti {
    NSLog(@"ClickWillButton");
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
