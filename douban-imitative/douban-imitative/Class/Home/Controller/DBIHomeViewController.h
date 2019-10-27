//
//  DBIHomeViewController.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBIHomeView.h"
#import "DBIHomeModel.h"
#import "DBIHomeHotButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIHomeViewController : UIViewController

@property DBIHomeView *homeView;

@property DBIHomeModel *hotHomeModel;
@property DBIHomeModel *willHomeModel;

@end

NS_ASSUME_NONNULL_END
