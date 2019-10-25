//
//  DBIListTableViewCell.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/18.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DBIListTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *postersListImageView;
@property (nonatomic, strong) UILabel *nameListLabel;
@property StarView *starView;
@property (nonatomic, strong) UITextView *introduceListTextView;
@property (nonatomic, strong) UILabel *dottedListLabel;
@property (nonatomic, strong) UIButton *buyListButton;
@property (nonatomic, strong) UILabel *peopleListLabel;

@end

NS_ASSUME_NONNULL_END
