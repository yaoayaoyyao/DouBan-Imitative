//
//  DBIDetailHeadView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/8.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIDetailHeadView : UIView

@property StarView *movieStarView;
@property UIImageView *movieImageView;
@property UILabel *movieTitleLabel;

@end

NS_ASSUME_NONNULL_END
