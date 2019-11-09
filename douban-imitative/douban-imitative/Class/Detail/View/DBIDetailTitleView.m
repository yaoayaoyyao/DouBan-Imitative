//
//  DBIDetailTitleView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailTitleView.h"
#import "Masonry.h"

@implementation DBIDetailTitleView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _titleImageView = [[UIImageView alloc] init];
    [self addSubview:_titleImageView];
    
    _nameTitleLabel = [[UILabel alloc] init];
    [self addSubview:_nameTitleLabel];
    
    _yearTitleLabel = [[UILabel alloc] init];
    [self addSubview:_yearTitleLabel];
    
    _allTitleTextView = [[UITextView alloc] init];
    [self addSubview:_allTitleTextView];
    
    _wantTitleButton = [[UIButton alloc] init];
    [self addSubview:_wantTitleButton];
    
    _haveTitleButton = [[UIButton alloc] init];
    [self addSubview:_haveTitleButton];
    
    return self;
}

- (void)layoutSubviews {
    [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(161));
    }];
    _titleImageView.layer.cornerRadius = 5;
    _titleImageView.layer.masksToBounds = YES;
    _titleImageView.image = [UIImage imageNamed:@"begin_1.jpg"];
    
    [_nameTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.titleImageView.mas_right).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 110));
        make.height.equalTo(@(30));
    }];
    _nameTitleLabel.text = @"我和我的祖国";
    _nameTitleLabel.textColor = [UIColor whiteColor];
    _nameTitleLabel.font = [UIFont systemFontOfSize:25];
    
    
    [_yearTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTitleLabel.mas_bottom).offset(5);
        make.left.equalTo(self.titleImageView.mas_right).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 110));
        make.height.equalTo(@(25));
    }];
    _yearTitleLabel.text = @"(2019)";
    _yearTitleLabel.textColor = [UIColor whiteColor];
    _yearTitleLabel.font = [UIFont systemFontOfSize:15];
    
    [_allTitleTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yearTitleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.titleImageView.mas_right).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 110));
        make.height.equalTo(@(50));
    }];
    _allTitleTextView.backgroundColor = [UIColor clearColor];
    _allTitleTextView.userInteractionEnabled = NO;
    _allTitleTextView.scrollEnabled = NO;
    _allTitleTextView.editable = NO;
    _allTitleTextView.textColor = [UIColor grayColor];
    [_allTitleTextView sizeToFit];
    _allTitleTextView.font = [UIFont systemFontOfSize:12];
    
    [_wantTitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTitleTextView.mas_bottom).offset(10);
        make.left.equalTo(self.titleImageView.mas_right).offset(10);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 130) / 2));
        make.height.equalTo(@(35));
    }];
    _wantTitleButton.backgroundColor = [UIColor whiteColor];
    [_wantTitleButton setImage:[UIImage imageNamed:@"want_title.png"] forState:UIControlStateNormal];
    [_wantTitleButton setTitle:@"想看" forState:UIControlStateNormal];
    _wantTitleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_wantTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _wantTitleButton.layer.cornerRadius = 5;
    _wantTitleButton.layer.masksToBounds = YES;
    
    [_haveTitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allTitleTextView.mas_bottom).offset(10);
        make.left.equalTo(self.wantTitleButton.mas_right).offset(10);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 130) / 2));
        make.height.equalTo(@(35));
    }];
    _haveTitleButton.backgroundColor = [UIColor whiteColor];
    [_haveTitleButton setImage:[UIImage imageNamed:@"have_title.png"] forState:UIControlStateNormal];
    [_haveTitleButton setTitle:@"看过" forState:UIControlStateNormal];
    _haveTitleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_haveTitleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _haveTitleButton.layer.cornerRadius = 5;
    _haveTitleButton.layer.masksToBounds = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
