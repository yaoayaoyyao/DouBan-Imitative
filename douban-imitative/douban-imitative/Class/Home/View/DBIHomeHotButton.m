//
//  DBIHomeHotButton.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/17.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeHotButton.h"
#import "Masonry.h"

@implementation DBIHomeHotButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _hotImageView = [[UIImageView alloc] init];
    [self addSubview:_hotImageView];
    
    _hotNameLabel = [[UILabel alloc] init];
    [self addSubview:_hotNameLabel];
    
    _hotStarView = [[StarView alloc] init];
    [self addSubview:_hotStarView];
    
    return self;
}

- (void)layoutSubviews {
    [_hotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 50) / 3));
        make.height.equalTo(@(1.61 * (([UIScreen mainScreen].bounds.size.width - 50) / 3)));
    }];
    _hotImageView.image = [UIImage imageNamed:@"begin_1.jpg"];
    
    [_hotNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotImageView.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(self.hotImageView.mas_width);
        make.height.equalTo(@(20));
    }];
    _hotNameLabel.text = @"你好霸王龙";
    _hotNameLabel.textColor = [UIColor blackColor];
    
    [_hotStarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hotNameLabel.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(self.hotImageView.mas_width);
        make.height.equalTo(@(10));
    }];
    _hotStarView.starScore = 7.1;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
