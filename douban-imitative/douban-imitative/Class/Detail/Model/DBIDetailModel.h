//
//  DBIDetailModel.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DBIDetailRatingModel

@end

@protocol DBIDetailImagesModel

@end

@protocol DBIDetailCastsSubjectModel

@end

@protocol DBIDetailDirectorsSubjectModel

@end

@interface DBIDetailRatingModel : JSONModel

@property (nonatomic) float average;

@end

@interface DBIDetailImagesModel : JSONModel

@property (nonatomic) NSString *small;

@end

@interface DBIDetailCastsSubjectModel : JSONModel

@property (nonatomic) NSString *name;

@end

@interface DBIDetailDirectorsSubjectModel : JSONModel

@property (nonatomic) NSString *name;

@end

@interface DBIDetailModel : JSONModel

@property (nonatomic) DBIDetailRatingModel *rating;
@property (nonatomic) int collect_count;
@property (nonatomic) DBIDetailImagesModel *images;
@property (nonatomic) NSString *year;
@property (nonatomic) NSString *title;
@property (nonatomic) NSArray *genres;
@property (nonatomic, copy) NSArray<DBIDetailCastsSubjectModel> *casts;
@property (nonatomic) NSArray *countries;
@property (nonatomic, copy) NSArray<DBIDetailDirectorsSubjectModel> *directors;

@end

NS_ASSUME_NONNULL_END
