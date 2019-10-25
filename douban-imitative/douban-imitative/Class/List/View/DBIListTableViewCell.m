//
//  DBIListTableViewCell.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListTableViewCell.h"
#import "Masonry.h"

@implementation DBIListTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _postersListImageView = [[UIImageView alloc] init];
    [self addSubview:_postersListImageView];
    
    _nameListLabel = [[UILabel alloc] init];
    [self addSubview:_nameListLabel];
    
    _starView = [[StarView alloc] init];
    [self addSubview:_starView];
    
    _introduceListTextView = [[UITextView alloc] init];
    [self addSubview:_introduceListTextView];
    
    _dottedListLabel = [[UILabel alloc] init];
    [self addSubview:_dottedListLabel];
    
    _buyListButton = [[UIButton alloc] init];
    [self addSubview:_buyListButton];
    
    _peopleListLabel = [[UILabel alloc] init];
    [self addSubview:_peopleListLabel];
    
    return self;
}

- (void)layoutSubviews {
    [_postersListImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.equalTo(self).offset(15);
        make.width.equalTo(@(110 / 1.61));
        make.height.equalTo(@(110));
    }];
    _postersListImageView.image = [UIImage imageNamed:@"begin_1.jpg"];
    _postersListImageView.layer.cornerRadius = 5;
    _postersListImageView.layer.masksToBounds = YES;
    
    [_nameListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.equalTo(self.postersListImageView.mas_right).offset(15);
        make.width.equalTo(@(170));
        make.height.equalTo(@(30));
    }];
    _nameListLabel.text = @"航海王：狂热行动";
    _nameListLabel.textColor = [UIColor blackColor];
    _nameListLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
    
    [_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameListLabel.mas_bottom).offset(5);
        make.left.equalTo(self.postersListImageView.mas_right).offset(15);
        make.width.equalTo(@(170));
        make.height.equalTo(@(10));
    }];
    _starView.starScore = 6.8;
    
    
    
    [_introduceListTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.starView.mas_bottom).offset(5);
        make.left.equalTo(self.postersListImageView.mas_right).offset(15);
        make.width.equalTo(@(170));
        make.height.equalTo(@(140 - 75));
    }];
    _introduceListTextView.userInteractionEnabled = NO;
    _introduceListTextView.scrollEnabled = NO;
    _introduceListTextView.editable = NO;
    _introduceListTextView.textColor = [UIColor grayColor];
    [_introduceListTextView sizeToFit];
    _introduceListTextView.text = @"2019 / 中国大陆 / 剧情 / 陈凯歌 张一白 管虎 薛晓路 徐峥 宁浩 文牧野 / 黄渤 张译";
    _introduceListTextView.font = [UIFont systemFontOfSize:12];
    
    [_dottedListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self.nameListLabel.mas_right).offset(15);
        make.width.equalTo(@(5));
        make.height.equalTo(@(130));
    }];
    _dottedListLabel.numberOfLines = 0;
    _dottedListLabel.text = @"׀׀׀׀׀׀׀׀׀׀";
    _dottedListLabel.textColor = [UIColor grayColor];
    _dottedListLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:10];
    
    [_buyListButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(50);
        make.left.equalTo(self.dottedListLabel.mas_right).offset(12);
        make.width.equalTo(@(60));
        make.height.equalTo(@(30));
    }];
    [_buyListButton setTitle:@"购票" forState:UIControlStateNormal];
    _buyListButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_buyListButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _buyListButton.layer.borderWidth = 1;
    _buyListButton.layer.borderColor = [[UIColor redColor]CGColor];
    _buyListButton.layer.cornerRadius = 5;
    _buyListButton.layer.masksToBounds = YES;
    
    [_peopleListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyListButton.mas_bottom).offset(5);
        make.left.equalTo(self.dottedListLabel.mas_right).offset(5);
        make.width.equalTo(@(80));
        make.height.equalTo(@(30));
    }];
    _peopleListLabel.text = @"44.2万人看过";
    _peopleListLabel.textAlignment = NSTextAlignmentCenter;
    _peopleListLabel.textColor = [UIColor grayColor];
    _peopleListLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor);
    CGContextStrokeRect(context, CGRectMake(15, rect.size.height, rect.size.width, 1));
}

@end
