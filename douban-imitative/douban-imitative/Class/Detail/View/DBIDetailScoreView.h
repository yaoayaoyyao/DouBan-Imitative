//
//  DBIDetailScoreView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIDetailScoreView : UIView

@property (nonatomic, strong) UILabel *titleScoreLabel;
@property (nonatomic, strong) UILabel *numberScoreLabel;
@property (nonatomic, strong) StarView *scoreStarView;
@property (nonatomic, strong) UIProgressView *fiveProgressView;
@property (nonatomic, strong) UIProgressView *fourProgressView;
@property (nonatomic, strong) UIProgressView *threeProgressView;
@property (nonatomic, strong) UIProgressView *twoProgressView;
@property (nonatomic, strong) UIProgressView *oneProgressView;
@property NSMutableArray <UIImageView *> *scoreStarArray;

@end

NS_ASSUME_NONNULL_END
