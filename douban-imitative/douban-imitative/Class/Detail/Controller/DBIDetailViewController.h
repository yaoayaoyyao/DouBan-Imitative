//
//  DBIDetailViewController.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBIDetailView.h"
#import "DBIDetailHeadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIDetailViewController : UIViewController 

@property BOOL flag;
@property NSString *ID;
@property UIImage *movieImage;
@property UIView *backView;
@property DBIDetailHeadView *headView;
@property DBIDetailView *detailView;

@end

NS_ASSUME_NONNULL_END
