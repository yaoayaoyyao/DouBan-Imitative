//
//  DBIOtherPageView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/13.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIOtherPageView.h"
#import "Masonry.h"

@implementation DBIOtherPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _textBackGroundView = [[UIView alloc] init];
    [self addSubview:_textBackGroundView];
    
    _otherPageTextField = [[UITextField alloc] init];
    [_textBackGroundView addSubview:_otherPageTextField];
    
    _messageButton = [[UIButton alloc] init];
    [self addSubview:_messageButton];
    
    _otherPageSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"动态", @"推荐", nil]];
    [self addSubview:_otherPageSegmentedControl];
    
    return self;
}

- (void)layoutSubviews {
    [_textBackGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width));
        make.height.equalTo(@(70));
    }];
    _textBackGroundView.backgroundColor = [UIColor colorWithRed:0.47f green:0.80f blue:0.23f alpha:1.00f];
    
    [_otherPageTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@([UIScreen mainScreen].bounds.size.width - 20));
        make.height.equalTo(@(35));
    }];
    _otherPageTextField.backgroundColor = [UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
    _otherPageTextField.borderStyle = UITextBorderStyleRoundedRect;
    _otherPageTextField.keyboardType = UIKeyboardTypeDefault;
    _otherPageTextField.delegate = self;
    _otherPageTextField.returnKeyType = UIReturnKeySearch;
    _otherPageTextField.layer.borderColor = [[UIColor whiteColor]CGColor];
    _otherPageTextField.layer.borderWidth = 1;
    _otherPageTextField.layer.cornerRadius = 18;
    _otherPageTextField.layer.masksToBounds = YES;
    
    //左边搜索图标总是显示
    _otherPageTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"radio_button_search.png"]];
    //左边搜索图标的模式
    leftImageView.contentMode = UIViewContentModeCenter;
    _otherPageTextField.leftView = leftImageView;
    
    _otherPageTextField.placeholder = @"在你的照片上画个小涂鸦";
    
    [_otherPageSegmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textBackGroundView.mas_bottom).offset(10);
        make.centerX.equalTo(self);
        make.width.equalTo(@(150));
        make.height.equalTo(@(30));
    }];
    _otherPageSegmentedControl.selectedSegmentIndex = 1;
    //在点击后是否恢复原样
    _otherPageSegmentedControl.momentary = NO;
    _otherPageSegmentedControl.layer.borderColor = [[UIColor clearColor]CGColor];
    _otherPageSegmentedControl.tintColor = [UIColor clearColor];
    [_otherPageSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor] , NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:18]} forState:UIControlStateNormal];
    [_otherPageSegmentedControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0.46f green:0.78f blue:0.24f alpha:1.00f], NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:18]} forState:UIControlStateSelected];
    
}

//键盘收起
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_otherPageTextField resignFirstResponder];
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
