//
//  DBIListPageManager.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBIListHotModel.h"
#import "DBIListHotIDModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^DBIListHotHandle)(DBIListHotModel *listHotModel);

typedef void(^DBIListHotIDHandle)(DBIListHotIDModel *listHotIDModel);

typedef void(^ErrorHandle)(NSError *error);

@interface DBIListPageManager : NSObject

+ (instancetype)sharedManager;

- (void)hotListNetworkSuccess:(DBIListHotHandle)succeedBlock error:(ErrorHandle)errorBlock;

- (void)hotListNetworkWithID:(NSString *)ID Success:(DBIListHotIDHandle)succeedBlock error:(ErrorHandle)errorBlock;

@end

NS_ASSUME_NONNULL_END
