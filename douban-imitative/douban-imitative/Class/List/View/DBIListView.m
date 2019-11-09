//
//  DBIListView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListView.h"
#import "Masonry.h"
#import "DBIListHotIDModel.h"

static NSString *listString = @"listTableViewCell";
@implementation DBIListView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _listModelArray = [[NSMutableArray alloc] init];
    
    _listSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"正在上映", @"即将上映", @"10月观影指南", nil]];
    [self addSubview:_listSegmentedControl];
    
    _listTableView = [[UITableView alloc] init];
    [_listTableView registerClass:[DBIListTableViewCell class] forCellReuseIdentifier:listString];
    _listTableView.delegate = self;
    _listTableView.dataSource = self;
    _listTableView.tag = 11;
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
    return _numberOfTableView;
//    return [_listModelArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_listModelArray count] == 0 || [_listModelArray count] != _numberOfTableView) {
        DBIListTableViewCell *listTableViewCell = [_listTableView dequeueReusableCellWithIdentifier:listString forIndexPath:indexPath];
        return listTableViewCell;
    }
    DBIListTableViewCell *listTableViewCell = [_listTableView dequeueReusableCellWithIdentifier:listString forIndexPath:indexPath];
    DBIListHotIDModel *listHotIDModel = _listModelArray[indexPath.row];
    listTableViewCell.nameListLabel.text = listHotIDModel.title;
    listTableViewCell.starView.starScore = listHotIDModel.rating.average;
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:listHotIDModel.images.small]];
    listTableViewCell.postersListImageView.image = [UIImage imageWithData:data];
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
        DBICastsSubjectModel *subject = listHotIDModel.directors[i];
        if (i == 0) {
            directors = [directors stringByAppendingFormat:@"%@", subject.name];
        } else {
            directors = [directors stringByAppendingFormat:@" %@", subject.name];
        }
    }
    NSString *casts = @"";
    for (int i = 0; i < [listHotIDModel.casts count]; i++) {
        DBICastsSubjectModel *subject = listHotIDModel.casts[i];
        if (i == 2) {
            break;
        }
        if (i == 0) {
            casts = [casts stringByAppendingFormat:@"%@", subject.name];
        } else {
            casts = [casts stringByAppendingFormat:@" %@", subject.name];
        }
    }
    listTableViewCell.introduceListTextView.text = [NSString stringWithFormat:@"%@ / %@ / %@ / %@ / %@ ", listHotIDModel.year, countries, genres, directors, casts];
    NSLog(@"%@", listTableViewCell.introduceListTextView.text);
    return listTableViewCell;
}

#pragma mark -- UITableViewDataSource
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 11 && scrollView.contentOffset.y >= 10 * 140 && _numberOfTableView == 10) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ListTableView" object:nil];
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
