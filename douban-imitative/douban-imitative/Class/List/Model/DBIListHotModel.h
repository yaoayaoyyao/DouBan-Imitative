//
//  DBIListHotModel.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DBIListSubjectsModel

@end

@interface DBIListSubjectsModel : JSONModel

@property (nonatomic) NSString *ID;

@end

@interface DBIListHotModel : JSONModel

@property (nonatomic, copy) NSArray<DBIListSubjectsModel> *subjects;

@end

NS_ASSUME_NONNULL_END
