//
//  DBIListViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListViewController.h"
#import "Masonry.h"
#import "DBIListPageManager.h"

@interface DBIListViewController ()

@end

@implementation DBIListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _listHotIDModelArray = [[NSMutableArray alloc] init];
    [self hotListNetwork];
    
    self.title = @"院线电影";
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"left_arrow"] style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    [leftButton setTintColor:[UIColor blackColor]];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"西安∨" style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
    [rightButton setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickListTableView) name:@"ListTableView" object:nil];
    
    _listView = [[DBIListView alloc] init];
    [self.view addSubview:_listView];
    _listView.numberOfTableView = 10;
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height));
    }];
    _listView.listModelArray = _listHotIDModelArray;
    
}

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)hotListNetwork {
    [[DBIListPageManager sharedManager] hotListNetworkSuccess:^(DBIListHotModel * _Nonnull listHotModel) {
        self.hotListModel = listHotModel;
        DBIListSubjectsModel *subject = self.hotListModel.subjects[0];
        NSLog(@"%@", subject.ID);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self hotListNetWithID];
            NSLog(@"%d", [self.hotListModel.subjects count]);
        }];
    } error:^(NSError * _Nonnull error) {
        NSLog(@"添加失败");
    }];
}

- (void)hotListNetWithID {
    for (int i = 0; i < /*[self.hotListModel.subjects count]*/ _listView.numberOfTableView; i++) {
        NSLog(@"%d", i);
        DBIListSubjectsModel *subject = self.hotListModel.subjects[i];
        [[DBIListPageManager sharedManager] hotListNetworkWithID:subject.ID Success:^(DBIListHotIDModel * _Nonnull listHotIDModel) {
            [self.listHotIDModelArray addObject:listHotIDModel];
            if (i == self.listView.numberOfTableView - 1) {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                    if ([self.listView.listModelArray count] != self.listView.numberOfTableView) {
//                        <#statements#>
//                    }
                    [self.listView.listTableView reloadData];
                    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ClickListTableView) name:@"ListTableView" object:nil];
                }];
            }
        } error:^(NSError * _Nonnull error) {
            NSLog(@"添加失败");
        }];
    }
}

- (void)ClickListTableView {
    _listView.numberOfTableView = 20;
    [self hotListNetwork];
//    [_listView.listTableView reloadData];
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
