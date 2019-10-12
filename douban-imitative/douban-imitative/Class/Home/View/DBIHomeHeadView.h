//
//  DBIHomeHeadView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBIHomeHeadView : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *homeHeadTextField;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UIButton *movieButton;
@property (nonatomic, strong) UIButton *tvButton;
@property (nonatomic, strong) UIButton *bookButton;
@property (nonatomic, strong) UIButton *novelButton;
@property (nonatomic, strong) UIButton *musicButton;
@property (nonatomic, strong) UIButton *cityButton;
@property (nonatomic, strong) UIScrollView *homeHeadScrollView;

@end

NS_ASSUME_NONNULL_END
