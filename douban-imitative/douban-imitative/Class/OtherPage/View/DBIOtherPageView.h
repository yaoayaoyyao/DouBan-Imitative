//
//  DBIOtherPageView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/13.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBIOtherPageView : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UIView *textBackGroundView;
@property (nonatomic, strong) UITextField *otherPageTextField;
@property (nonatomic, strong) UIButton *messageButton;
@property (nonatomic, strong) UISegmentedControl *otherPageSegmentedControl;

@end

NS_ASSUME_NONNULL_END
