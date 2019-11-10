//
//  DBIDetailManager.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBIDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^DBIDetailHandel)(DBIDetailModel *listHotIDModel);

typedef void(^ErrorHandle)(NSError *error);

@interface DBIDetailManager : NSObject

- (void)hotDetailNetworkWithID:(NSString *)ID Success:(DBIDetailHandel)succeedBlock error:(ErrorHandle)errorBlock;

@end

NS_ASSUME_NONNULL_END
