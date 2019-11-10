//
//  DBIDetailView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailView.h"
#import "Masonry.h"

@implementation DBIDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _flag = false;
    
    _detailTableView = [[UITableView alloc] init];
    _detailTableView.tag = 1;
    _detailTableView.backgroundColor = [UIColor clearColor];
    _detailTableView.delegate = self;
    _detailTableView.dataSource = self;
    [self addSubview:_detailTableView];
    
    _titleDetailView = [[DBIDetailTitleView alloc] init];
    [_detailTableView addSubview:_titleDetailView];
//    _detailTableView.tableHeaderView = _titleDetailView;
    
    _scoreDetailView = [[DBIDetailScoreView alloc] init];
    [_detailTableView addSubview:_scoreDetailView];
    
    return self;
}

- (void)layoutSubviews {
    //获取状态栏的rect
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    [_detailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(statusRect.size.height + 44);
        make.left.equalTo(self);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@([UIScreen mainScreen].bounds.size.height - statusRect.size.height - 74));
    }];
    
    [_titleDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailTableView);
        make.left.equalTo(self.detailTableView);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(170));
    }];
    
    [_scoreDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleDetailView.mas_bottom).offset(10);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 20));
        make.height.equalTo(@(120));
    }];
    _scoreDetailView.layer.cornerRadius = 5;
    _scoreDetailView.layer.masksToBounds = YES;
}

#pragma mark -- UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 1 && scrollView.contentOffset.y > 20 && _flag == false) {
        _flag = true;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollDown" object:nil];
    } else if (scrollView.tag == 1 && scrollView.contentOffset.y <= 20 && _flag == true) {
        _flag = false;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollUp" object:nil];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
