//
//  DBIListViewController.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBIListView.h"
#import "DBIListHotModel.h"
#import "DBIListHotIDModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIListViewController : UIViewController

@property (nonatomic, strong) DBIListView *listView;
@property DBIListHotModel *hotListModel;
@property NSMutableArray <DBIListHotIDModel *> *listHotIDModelArray;

@end

NS_ASSUME_NONNULL_END
