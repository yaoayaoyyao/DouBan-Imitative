//
//  DBIHomeView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBIHomeHeadView.h"
#import "DBIHomeHotView.h"
#import "DBIHomeWillView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIHomeView : UIView

@property DBIHomeHeadView *homeHeadView;
@property (nonatomic, strong) UISegmentedControl *homeSegmentedControl;
@property (nonatomic, strong) UIButton *homeButton;
@property (nonatomic, strong) UIScrollView *homeScrollView;
@property DBIHomeHotView *hotView;
@property DBIHomeWillView *willView;

@end

NS_ASSUME_NONNULL_END
