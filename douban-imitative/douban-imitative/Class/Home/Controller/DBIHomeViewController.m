//
//  DBIHomeViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeViewController.h"
#import "Masonry.h"

@interface DBIHomeViewController ()

@end

@implementation DBIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _homeView = [[DBIHomeView alloc] init];
    [self.view addSubview:_homeView];
//    [_homeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self);
//        make.left.equalTo(self);
//        make.width.equalTo(@(self.view.bounds.size.width));
//        make.height.equalTo(@(self.view.bounds.size.height));
//    }];
    _homeView.frame = CGRectMake(0, 0, 375, 812);
    
    [_homeView.homeSegmentedControl addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    
}

#pragma mark -- UISegmentedControl
- (void)changeView:(UISegmentedControl *)segmentedControl{
//    if (segmentedControl.selectedSegmentIndex == 0) {
//        [_secondView.secondScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//    }
//    else if (segmentedControl.selectedSegmentIndex == 1) {
//        [_secondView.secondScrollView setContentOffset:CGPointMake(375, 0) animated:YES];
//    }
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
