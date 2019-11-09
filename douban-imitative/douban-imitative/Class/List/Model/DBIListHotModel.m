//
//  DBIListHotModel.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIListHotModel.h"

@implementation DBIListSubjectsModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"ID":@"id"
                                                                  }];
}

@end

@implementation DBIListHotModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
