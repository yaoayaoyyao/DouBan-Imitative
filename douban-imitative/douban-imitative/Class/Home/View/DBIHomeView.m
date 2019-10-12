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
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
