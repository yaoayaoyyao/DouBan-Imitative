//
//  DBIDetailHeadView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/8.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailHeadView.h"
#import "Masonry.h"

@implementation DBIDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _movieStarView = [[StarView alloc] init];
    [self addSubview:_movieStarView];
    
    _movieImageView = [[UIImageView alloc] init];
    [self addSubview:_movieImageView];
    
    _movieTitleLabel = [[UILabel alloc] init];
    [self addSubview:_movieTitleLabel];
    
    return self;
}

- (void)layoutSubviews {
    _movieStarView.scoreLabel.textColor = [UIColor whiteColor];
    
    [_movieImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@(30));
        make.height.equalTo(@(40));
    }];
    _movieImageView.layer.cornerRadius = 5;
    _movieImageView.layer.masksToBounds = YES;
    _movieImageView.image = [UIImage imageNamed:@"begin_1.jpg"];
    
    [_movieTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.movieImageView.mas_right).offset(5);
        make.width.equalTo(@(150));
        make.height.equalTo(@(15));
    }];
    _movieTitleLabel.text = @"航海王：狂热行动";
    _movieTitleLabel.textColor = [UIColor whiteColor];
    _movieTitleLabel.font = [UIFont systemFontOfSize:15];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
