//
//  DBIDetailView.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DBIDetailView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *detailTableView;
@property BOOL flag;

@end

NS_ASSUME_NONNULL_END
