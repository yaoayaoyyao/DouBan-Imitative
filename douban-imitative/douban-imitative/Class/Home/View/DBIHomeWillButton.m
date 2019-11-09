//
//  DBIHomeWillButton.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/17.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeWillButton.h"
#import "Masonry.h"

@implementation DBIHomeWillButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _willImageView = [[UIImageView alloc] init];
    [self addSubview:_willImageView];
    
    _willNameLabel = [[UILabel alloc] init];
    [self addSubview:_willNameLabel];
    
    _willNumberLabel = [[UILabel alloc] init];
    [self addSubview:_willNumberLabel];
    
    _willTimeLabel = [[UILabel alloc] init];
    [self addSubview:_willTimeLabel];
    
    return self;
}

- (void)layoutSubviews {
    [_willImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 50) / 3));
        make.height.equalTo(@(1.61 * (([UIScreen mainScreen].bounds.size.width - 50) / 3)));
    }];
    
    [_willNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.willImageView.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(self.willImageView.mas_width);
        make.height.equalTo(@(20));
    }];
    _willNameLabel.font = [UIFont systemFontOfSize:12];
    _willNameLabel.textColor = [UIColor blackColor];
    
    
    [_willNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.willNameLabel.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(self.willImageView.mas_width);
        make.height.equalTo(@(15));
    }];
//    _willNumberLabel.text = @"1113人想看";
    _willNumberLabel.textColor = [UIColor grayColor];
    _willNumberLabel.font = [UIFont systemFontOfSize:13];
    
    [_willTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.willNumberLabel.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 50) / 6));
        make.height.equalTo(@(20));
    }];
    _willTimeLabel.textAlignment = NSTextAlignmentCenter;
    _willTimeLabel.layer.cornerRadius = 3;
    _willTimeLabel.layer.masksToBounds = YES;
    _willTimeLabel.textColor = [UIColor redColor];
    _willTimeLabel.font = [UIFont systemFontOfSize:10];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
