//
//  DBIHomeHeadView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeHeadView.h"
#import "Masonry.h"

@implementation DBIHomeHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _homeHeadTextField = [[UITextField alloc] init];
    [self addSubview:_homeHeadTextField];
    
    _messageButton = [[UIButton alloc] init];
    [self addSubview:_messageButton];
    
    _homeHeadScrollView = [[UIScrollView alloc] init];
    [self addSubview:_homeHeadScrollView];
    
    _movieButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_movieButton];
    
    _tvButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_tvButton];
    
    _bookButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_bookButton];
    
    _novelButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_novelButton];
    
    _musicButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_musicButton];
    
    _cityButton = [[UIButton alloc] init];
    [_homeHeadScrollView addSubview:_cityButton];
    
    return self;
}

- (void)layoutSubviews {
    [_homeHeadTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 20));
        make.height.equalTo(@(40));
    }];
    _homeHeadTextField.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
    _homeHeadTextField.borderStyle = UITextBorderStyleRoundedRect;
    _homeHeadTextField.keyboardType = UIKeyboardTypeDefault;
    _homeHeadTextField.delegate = self;
    _homeHeadTextField.returnKeyType = UIReturnKeySearch;
    _homeHeadTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    _homeHeadTextField.layer.borderWidth = 1;
    _homeHeadTextField.layer.cornerRadius = 18;
    _homeHeadTextField.layer.masksToBounds = YES;
    
    //左边搜索图标总是显示
    _homeHeadTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"radio_button_search.png"]];
    //左边搜索图标的模式
    leftImageView.contentMode = UIViewContentModeCenter;
    _homeHeadTextField.leftView = leftImageView;
    
    _homeHeadTextField.placeholder = @"动画番剧小组";
//    //修改Placeholder字体的颜色
//    [_homeHeadTextField setValue:[UIColor blackColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    
    _homeHeadScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width + 1, 50);
    _homeHeadScrollView.showsHorizontalScrollIndicator = NO;
    [_homeHeadScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadTextField.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(50));
    }];
    
    [_movieButton setTitle:@"电影" forState:UIControlStateNormal];
    [_movieButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [_tvButton setTitle:@"电视" forState:UIControlStateNormal];
    [_tvButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_bookButton setTitle:@"读书" forState:UIControlStateNormal];
    [_bookButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_novelButton setTitle:@"原创小说" forState:UIControlStateNormal];
    [_novelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_musicButton setTitle:@"音乐" forState:UIControlStateNormal];
    [_musicButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_cityButton setTitle:@"同城" forState:UIControlStateNormal];
    [_cityButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [_movieButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self.homeHeadScrollView).offset(5);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 60 - 30) / 6));
        make.height.equalTo(@(50));
    }];
    
    [_tvButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self->_movieButton.mas_right).offset(10);
        make.size.equalTo(self->_movieButton);
    }];
    
    [_bookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self->_tvButton.mas_right).offset(10);
        make.size.equalTo(self->_movieButton);
    }];
    
    [_novelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self->_bookButton.mas_right).offset(10);
        make.width.equalTo(@(([UIScreen mainScreen].bounds.size.width - 60 - 30) / 6 + 30));
        make.height.equalTo(@(50));
    }];
    
    [_musicButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self->_novelButton.mas_right).offset(10);
        make.size.equalTo(self->_movieButton);
    }];
    
    [_cityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeHeadScrollView);
        make.left.equalTo(self->_musicButton.mas_right).offset(10);
        make.size.equalTo(self->_movieButton);
    }];
    
}

//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_homeHeadTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
