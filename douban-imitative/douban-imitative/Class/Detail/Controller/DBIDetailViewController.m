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
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:listHotIDModel.images.small]];
            self.detailView.titleDetailView.titleImageView.image = [UIImage imageWithData:data];
            self.detailView.titleDetailView.nameTitleLabel.text = listHotIDModel.title;
            self.detailView.titleDetailView.yearTitleLabel.text = [NSString stringWithFormat:@"(%@)",listHotIDModel.year];
            NSString *countries = @"";
            for (int i = 0; i < [listHotIDModel.countries count]; i++) {
                if (i == 0) {
                    countries = [countries stringByAppendingFormat:@"%@", listHotIDModel.countries[i]];
                } else {
                    countries = [countries stringByAppendingFormat:@" %@", listHotIDModel.countries[i]];
                }
            }
            NSString *genres = @"";
            for (int i = 0; i < [listHotIDModel.genres count]; i++) {
                if (i == 0) {
                    genres = [genres stringByAppendingFormat:@"%@", listHotIDModel.genres[i]];
                } else {
                    genres = [genres stringByAppendingFormat:@" %@", listHotIDModel.genres[i]];
                }
            }
            NSString *directors = @"";
            for (int i = 0; i < [listHotIDModel.directors count]; i++) {
                DBIDetailCastsSubjectModel *subject = listHotIDModel.directors[i];
                if (i == 0) {
                    directors = [directors stringByAppendingFormat:@"%@", subject.name];
                } else {
                    directors = [directors stringByAppendingFormat:@" %@", subject.name];
                }
            }
            NSString *casts = @"";
            for (int i = 0; i < [listHotIDModel.casts count]; i++) {
                DBIDetailCastsSubjectModel *subject = listHotIDModel.casts[i];
                if (i == 2) {
                    break;
                }
                if (i == 0) {
                    casts = [casts stringByAppendingFormat:@"%@", subject.name];
                } else {
                    casts = [casts stringByAppendingFormat:@" %@", subject.name];
                }
            }
            self.detailView.titleDetailView.allTitleTextView.text = [NSString stringWithFormat:@"%@ / %@ / %@ / %@ / %@ ", listHotIDModel.year, countries, genres, directors, casts];
            
            self.detailView.scoreDetailView.numberScoreLabel.text = [NSString stringWithFormat:@"%.1f", listHotIDModel.rating.average];
            float all = listHotIDModel.rating.details.one + listHotIDModel.rating.details.two + listHotIDModel.rating.details.three + listHotIDModel.rating.details.four + listHotIDModel.rating.details.five;
            self.detailView.scoreDetailView.fiveProgressView.progress = (listHotIDModel.rating.details.five / all);
            self.detailView.scoreDetailView.fourProgressView.progress = (listHotIDModel.rating.details.four / all);
            self.detailView.scoreDetailView.threeProgressView.progress = (listHotIDModel.rating.details.three / all);
            self.detailView.scoreDetailView.twoProgressView.progress = (listHotIDModel.rating.details.two / all);
            self.detailView.scoreDetailView.oneProgressView.progress = (listHotIDModel.rating.details.one / all);
            
            self.detailView.scoreDetailView.scoreStarView.starScore = listHotIDModel.rating.average;
            [self.detailView.scoreDetailView.scoreStarView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.detailView.scoreDetailView.numberScoreLabel.mas_bottom).offset(-5);
                make.left.equalTo(self.detailView.scoreDetailView.numberScoreLabel).offset(-5);
                make.width.equalTo(@(50));
                make.height.equalTo(@(10));
            }];
        }];
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
