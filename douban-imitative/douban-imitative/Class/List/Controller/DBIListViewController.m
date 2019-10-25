//
//  DBIListViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListViewController.h"
#import "Masonry.h"

@interface DBIListViewController ()

@end

@implementation DBIListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"院线电影";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left_arrow"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    [leftButton setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"西安∨" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    [rightButton setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    _listView = [[DBIListView alloc] init];
    [self.view addSubview:_listView];
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    
    
}

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
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
