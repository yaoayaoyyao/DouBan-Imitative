//
//  DBIDetailTitleView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBIDetailTitleView : UIView

@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *nameTitleLabel;
@property (nonatomic, strong) UILabel *yearTitleLabel;
@property (nonatomic, strong) UITextView *allTitleTextView;
@property (nonatomic, strong) UIButton *wantTitleButton;
@property (nonatomic, strong) UIButton *haveTitleButton;

@end

NS_ASSUME_NONNULL_END
