//
//  DBIListTableViewCellTwo.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListTableViewCellTwo.h"
#import "Masonry.h"

@implementation DBIListTableViewCellTwo

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    _postersListImageView = [[UIImageView alloc] init];
    [self addSubview:_postersListImageView];
    
    _nameListLabel = [[UILabel alloc] init];
    [self addSubview:_nameListLabel];
    
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
    _postersListImageView.layer.cornerRadius = 5;
    _postersListImageView.layer.masksToBounds = YES;
    
    [_nameListLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(15);
        make.left.equalTo(self.postersListImageView.mas_right).offset(15);
        make.width.equalTo(@(170));
        make.height.equalTo(@(30));
    }];
    _nameListLabel.textColor = [UIColor blackColor];
    _nameListLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
    
    [_introduceListTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameListLabel.mas_bottom).offset(20);
        make.left.equalTo(self.postersListImageView.mas_right).offset(15);
        make.width.equalTo(@(170));
        make.height.equalTo(@(140 - 75));
    }];
    _introduceListTextView.userInteractionEnabled = NO;
    _introduceListTextView.scrollEnabled = NO;
    _introduceListTextView.editable = NO;
    _introduceListTextView.textColor = [UIColor grayColor];
    [_introduceListTextView sizeToFit];
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
    [_buyListButton setTitle:@"---" forState:UIControlStateNormal];
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
    _peopleListLabel.text = @"----------";
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
