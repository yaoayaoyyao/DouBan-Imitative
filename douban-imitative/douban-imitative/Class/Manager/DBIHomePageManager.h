//
//  DBIHomePageManager.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/25.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBIHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^DBIHomePageHandle)(DBIHomeModel *homeModel);

typedef void(^ErrorHandle)(NSError *error);

@interface DBIHomePageManager : NSObject

+ (instancetype)sharedManager;

- (void)hotNetworkRequestSuccess:(DBIHomePageHandle)succeedBlock error:(ErrorHandle)errorBlock;

- (void)willNetworkRequestSuccess:(DBIHomePageHandle)succeedBlock error:(ErrorHandle)errorBlock;

@end

NS_ASSUME_NONNULL_END
