//
//  DBIHomeHotButton.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/17.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIHomeHotButton : UIButton

@property (nonatomic, strong) UIImageView *hotImageView;
@property (nonatomic, strong) UILabel *hotNameLabel;
@property (nonatomic, strong) StarView *hotStarView;

@end

NS_ASSUME_NONNULL_END
