//
//  StarView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/20.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StarView : UIView

@property double starScore;
@property (nonatomic, strong) UILabel *scoreLabel;

@end

NS_ASSUME_NONNULL_END
