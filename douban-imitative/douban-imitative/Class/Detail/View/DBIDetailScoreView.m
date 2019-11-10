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
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    self.backgroundColor = [UIColor blackColor];
    self.alpha = 0.5;
    
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
    
    _numberOfPeopleLabel = [[UILabel alloc] init];
    [self addSubview:_numberOfPeopleLabel];
    
    _peopleScoreLabel = [[UILabel alloc] init];
    [self addSubview:_peopleScoreLabel];
    
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
    
//    _numberScoreLabel.text = @"6.7";
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
//    _fiveProgressView.progress = 0.8;
    _fiveProgressView.layer.cornerRadius = 4;
    _fiveProgressView.layer.masksToBounds = YES;
    
    [_fourProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fiveProgressView.mas_bottom).offset(2);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _fourProgressView.backgroundColor = [UIColor lightGrayColor];
    _fourProgressView.progressTintColor = [UIColor orangeColor];
    _fourProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    _fourProgressView.progress = 0.8;
    _fourProgressView.layer.cornerRadius = 4;
    _fourProgressView.layer.masksToBounds = YES;
    
    [_threeProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.fourProgressView.mas_bottom).offset(2);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _threeProgressView.backgroundColor = [UIColor lightGrayColor];
    _threeProgressView.progressTintColor = [UIColor orangeColor];
    _threeProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    _threeProgressView.progress = 0.8;
    _threeProgressView.layer.cornerRadius = 4;
    _threeProgressView.layer.masksToBounds = YES;
    
    [_twoProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeProgressView.mas_bottom).offset(2);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _twoProgressView.backgroundColor = [UIColor lightGrayColor];
    _twoProgressView.progressTintColor = [UIColor orangeColor];
    _twoProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    _twoProgressView.progress = 0.8;
    _twoProgressView.layer.cornerRadius = 4;
    _twoProgressView.layer.masksToBounds = YES;
    
    [_oneProgressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoProgressView.mas_bottom).offset(2);
        make.left.equalTo(self.numberScoreLabel.mas_right).offset(55);
        make.width.equalTo(@(165));
        make.height.equalTo(@(6));
    }];
    _oneProgressView.backgroundColor = [UIColor lightGrayColor];
    _oneProgressView.progressTintColor = [UIColor orangeColor];
    _oneProgressView.progressViewStyle = UIProgressViewStyleDefault;
//    _oneProgressView.progress = 0.8;
    _oneProgressView.layer.cornerRadius = 4;
    _oneProgressView.layer.masksToBounds = YES;
    
    _numberOfPeopleLabel.text = @"7922人评分";
    _numberOfPeopleLabel.textAlignment = NSTextAlignmentRight;
    _numberOfPeopleLabel.textColor = [UIColor whiteColor];
    _numberOfPeopleLabel.font = [UIFont systemFontOfSize:10];
    [_numberOfPeopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneProgressView.mas_bottom);
        make.right.equalTo(self.fiveProgressView);
        make.width.equalTo(@(70));
        make.height.equalTo(@(10));
    }];
    
    _peopleScoreLabel.text = @"9460人看过 5.7万人想看";
    _peopleScoreLabel.textAlignment = NSTextAlignmentRight;
    _peopleScoreLabel.textColor = [UIColor whiteColor];
    _peopleScoreLabel.font = [UIFont systemFontOfSize:12];
    [_peopleScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.numberOfPeopleLabel.mas_bottom);
        make.right.equalTo(self.oneProgressView).offset(20);
        make.width.equalTo(@(150));
        make.height.equalTo(@(20));
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
