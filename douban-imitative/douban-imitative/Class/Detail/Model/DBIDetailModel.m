//
//  DBIDetailModel.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailModel.h"

@implementation DBIDetailDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"one":@"1",
                                                                  @"two":@"2",
                                                                  @"three":@"3",
                                                                  @"four":@"4",
                                                                  @"five":@"5",
                                                                  }];
}

@end

@implementation DBIDetailRatingModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation DBIDetailImagesModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation DBIDetailCastsSubjectModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation DBIDetailDirectorsSubjectModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation DBIDetailModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end
