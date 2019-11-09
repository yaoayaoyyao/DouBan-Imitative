//
//  DBIListView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBIListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIListView : UIView
<UITableViewDelegate, UITableViewDataSource>

@property int numberOfTableView;
@property (nonatomic, strong) UISegmentedControl *listSegmentedControl;
@property (nonatomic, strong) UITableView *listTableView;
@property NSMutableArray *listModelArray;

@end

NS_ASSUME_NONNULL_END
