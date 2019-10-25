//
//  DBIHomeView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeView.h"
#import "Masonry.h"

@implementation DBIHomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _homeHeadView = [[DBIHomeHeadView alloc] init];
    [self addSubview: _homeHeadView];
    
    _homeSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"影院热映", @"即将上映", nil]];
    [self addSubview:_homeSegmentedControl];
    
    _homeButton = [[UIButton alloc] init];
    [self addSubview:_homeButton];
    
    _homeScrollView = [[UIScrollView alloc] init];
    [self addSubview:_homeScrollView];
    
    _hotView = [[DBIHomeHotView alloc] init];
    [self.homeScrollView addSubview:_hotView];
    
    _willView = [[DBIHomeWillView alloc] init];
    [self.homeScrollView addSubview:_willView];
    
    return self;
}

- (void)layoutSubviews {
    [_homeHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@(self.bounds.size.width));
        make.height.equalTo(@(125));
    }];
    
    [_homeSegmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadView.mas_bottom).offset(10);
        make.left.equalTo(self);
        make.width.equalTo(@(200));
        make.height.equalTo(@(30));
    }];
    _homeSegmentedControl.selectedSegmentIndex = 0;
    //在点击后是否恢复原样
    _homeSegmentedControl.momentary = NO;
    _homeSegmentedControl.layer.borderColor = [[UIColor clearColor]CGColor];
    _homeSegmentedControl.tintColor = [UIColor clearColor];
    [_homeSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] , NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:20]} forState:UIControlStateNormal];
    [_homeSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:20]} forState:UIControlStateSelected];
    [_homeSegmentedControl addTarget:self action:@selector(changeTableView:) forControlEvents:UIControlEventValueChanged];
    
    [_homeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadView.mas_bottom).offset(12);
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(30));
    }];
    [_homeButton setTitle:@"全部28 >" forState:UIControlStateNormal];
    [_homeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _homeButton.titleLabel.font = [UIFont systemFontOfSize:15];
//    [_homeButton setImage:[UIImage imageNamed:@"right_arrow"] forState:UIControlStateNormal];
    
    [_homeScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeSegmentedControl.mas_bottom).offset(10);
        make.left.equalTo(self);
        make.width.equalTo(@(self.bounds.size.width));
        make.height.equalTo(@(3.22 * (self.bounds.size.width - 50) / 3 + 160));
    }];
    _homeScrollView.contentSize = CGSizeMake(self.bounds.size.width * 2, 3.22 * (self.bounds.size.width - 50) / 3 + 160);
    _homeScrollView.showsHorizontalScrollIndicator = NO;
    _homeScrollView.pagingEnabled = YES;
    _homeScrollView.scrollEnabled = NO;
    
    [_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_homeScrollView);
        make.left.equalTo(self->_homeScrollView);
        make.size.equalTo(self->_homeScrollView);
    }];
    [_willView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_homeScrollView);
        make.left.equalTo(self->_homeScrollView).offset(self.bounds.size.width);
        make.size.equalTo(self->_homeScrollView);
    }];
    
}

- (void)changeTableView:(UISegmentedControl *)segmentedControl{
    if (segmentedControl.selectedSegmentIndex == 0) {
        [_homeButton setTitle:@"全部28 >" forState:UIControlStateNormal];
        [_homeScrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    else if (segmentedControl.selectedSegmentIndex == 1) {
        [_homeButton setTitle:@"全部77 >" forState:UIControlStateNormal];
        [_homeScrollView setContentOffset:CGPointMake(self.bounds.size.width, 0) animated:NO];
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
