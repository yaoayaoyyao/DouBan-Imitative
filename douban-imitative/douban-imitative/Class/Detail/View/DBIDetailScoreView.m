//
//  DBIDetailScoreView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailScoreView.h"
#import <Masonry.h>

@implementation DBIDetailScoreView
//@property (nonatomic, strong) UILabel *titleScoreLabel;
//@property (nonatomic, strong) UILabel *numberScoreLabel;
//@property (nonatomic, strong) StarView *scoreStarView;
//@property (nonatomic, strong) UIProgressView *fiveProgressView;
//@property (nonatomic, strong) UIProgressView *fourProgressView;
//@property (nonatomic, strong) UIProgressView *threeProgressView;
//@property (nonatomic, strong) UIProgressView *twoProgressView;
//@property (nonatomic, strong) UIProgressView *oneProgressView;
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    _scoreStarArray = [NSMutableArray array];
    for (int i = 0; i < 15; i++) {
        UIImageView *scoreStarImageView = [[UIImageView alloc] init];
        scoreStarImageView.tag = i;
        scoreStarImageView.image = [UIImage imageNamed:@"stars_empty.png"];
        [_scoreStarArray addObject:scoreStarImageView];
        [self addSubview:scoreStarImageView];
    }
    
    _titleScoreLabel = [[UILabel alloc] init];
    [self addSubview:_titleScoreLabel];
    
    _numberScoreLabel = [[UILabel alloc] init];
    [self addSubview:_numberScoreLabel];
    
    _scoreStarView = [[StarView alloc] init];
    [self addSubview:_scoreStarView];
    
    _fiveProgressView = [[UIProgressView alloc] init];
    [self addSubview:_fiveProgressView];
    
    _fourProgressView = [[UIProgressView alloc] init];
    [self addSubview:_fourProgressView];
    
    _threeProgressView = [[UIProgressView alloc] init];
    [self addSubview:_threeProgressView];
    
    _twoProgressView = [[UIProgressView alloc] init];
    [self addSubview:_twoProgressView];
    
    _oneProgressView = [[UIProgressView alloc] init];
    [self addSubview:_oneProgressView];
    
    return self;
}

- (void)layoutSubviews {
    _titleScoreLabel.text = @"豆瓣评分TM";
    _titleScoreLabel.font = [UIFont systemFontOfSize:12];
    _titleScoreLabel.textColor = [UIColor whiteColor];
    [_titleScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(100));
        make.height.equalTo(@(20));
    }];
    
    _numberScoreLabel.text = @"6.7";
    _numberScoreLabel.textAlignment = NSTextAlignmentCenter;
    _numberScoreLabel.textColor = [UIColor whiteColor];
    _numberScoreLabel.font = [UIFont systemFontOfSize:25];
    [_numberScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleScoreLabel.mas_bottom);
        make.left.equalTo(self).offset(50);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    int flag = 0;
    for (int i = 5; i > 0; i--) {
        for (int j = i; j > 0; j--) {
            UIImageView *scoreStarImageView = [[UIImageView alloc] init];
            scoreStarImageView = _scoreStarArray[flag++];
            scoreStarImageView.frame = CGRectMake(110 + (5 - j) * 8, 25 + (6 - i) * 8, 8, 8);
        }
    }
    
    [_fiveProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleScoreLabel.mas_bottom).offset(10);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _fiveProgressView.backgroundColor = [UIColor lightGrayColor];
    _fiveProgressView.progressTintColor = [UIColor orangeColor];
    _fiveProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _fiveProgressView.progress = 0.8;
    _fiveProgressView.layer.cornerRadius = 4;
    _fiveProgressView.layer.masksToBounds = YES;
    
    [_fourProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fiveProgressView.mas_bottom);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _fourProgressView.backgroundColor = [UIColor lightGrayColor];
    _fourProgressView.progressTintColor = [UIColor orangeColor];
    _fourProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _fourProgressView.progress = 0.8;
    _fourProgressView.layer.cornerRadius = 4;
    _fourProgressView.layer.masksToBounds = YES;
    
    [_threeProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourProgressView.mas_bottom);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _threeProgressView.backgroundColor = [UIColor lightGrayColor];
    _threeProgressView.progressTintColor = [UIColor orangeColor];
    _threeProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _threeProgressView.progress = 0.8;
    _threeProgressView.layer.cornerRadius = 4;
    _threeProgressView.layer.masksToBounds = YES;
    
    [_twoProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeProgressView.mas_bottom);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _twoProgressView.backgroundColor = [UIColor lightGrayColor];
    _twoProgressView.progressTintColor = [UIColor orangeColor];
    _twoProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _twoProgressView.progress = 0.8;
    _twoProgressView.layer.cornerRadius = 4;
    _twoProgressView.layer.masksToBounds = YES;
    
    [_oneProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoProgressView.mas_bottom);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _oneProgressView.backgroundColor = [UIColor lightGrayColor];
    _oneProgressView.progressTintColor = [UIColor orangeColor];
    _oneProgressView.progressViewStyle = UIProgressViewStyleDefault;
    _oneProgressView.progress = 0.8;
    _oneProgressView.layer.cornerRadius = 4;
    _oneProgressView.layer.masksToBounds = YES;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
