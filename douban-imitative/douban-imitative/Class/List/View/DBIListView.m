//
//  DBIListView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListView.h"
#import "DBIListTableViewCell.h"
#import "Masonry.h"

static NSString *listString = @"listTableViewCell";
@implementation DBIListView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _listSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"正在上映", @"即将上映", @"10月观影指南", nil]];
    [self addSubview:_listSegmentedControl];
    
    _listTableView = [[UITableView alloc] init];
    [_listTableView registerClass:[DBIListTableViewCell class] forCellReuseIdentifier:listString];
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    [self addSubview:_listTableView];
    
    
    
    return self;
}

- (void)layoutSubviews {
    //获取状态栏的rect
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    [_listSegmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(statusRect.size.height + 44);
        make.left.equalTo(self);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(30));
    }];
    _listSegmentedControl.selectedSegmentIndex = 0;
    //在点击后是否恢复原样
    _listSegmentedControl.momentary = NO;
    _listSegmentedControl.layer.borderColor = [[UIColor clearColor]CGColor];
    _listSegmentedControl.tintColor = [UIColor clearColor];
    [_listSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] , NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:16]} forState:UIControlStateNormal];
    [_listSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:16]} forState:UIControlStateSelected];

    [_listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.listSegmentedControl.mas_bottom).offset(10);
        make.left.equalTo(self);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height - statusRect.size.height - 74));
    }];
    
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 31;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBIListTableViewCell *listTableViewCell = [_listTableView dequeueReusableCellWithIdentifier:listString forIndexPath:indexPath];

    return listTableViewCell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
