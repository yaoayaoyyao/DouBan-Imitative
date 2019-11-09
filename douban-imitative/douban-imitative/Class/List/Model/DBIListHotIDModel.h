//
//  DBIListHotIDModel.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/3.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DBIListRatingModel

@end

@protocol DBIListImagesModel

@end

@protocol DBICastsSubjectModel

@end

@protocol DBIDirectorsSubjectModel

@end

@interface DBIListRatingModel : JSONModel

@property (nonatomic) float average;

@end

@interface DBIListImagesModel : JSONModel

@property (nonatomic) NSString *small;

@end

@interface DBICastsSubjectModel : JSONModel

@property (nonatomic) NSString *name;

@end

@interface DBIDirectorsSubjectModel : JSONModel

@property (nonatomic) NSString *name;

@end

@interface DBIListHotIDModel : JSONModel

@property (nonatomic) DBIListRatingModel *rating;
@property (nonatomic) int collect_count;
@property (nonatomic) DBIListImagesModel *images;
@property (nonatomic) NSString *year;
@property (nonatomic) NSString *title;
@property (nonatomic) NSArray *genres;
@property (nonatomic, copy) NSArray<DBICastsSubjectModel> *casts;
@property (nonatomic) NSArray *countries;
@property (nonatomic, copy) NSArray<DBIDirectorsSubjectModel> *directors;

@end

NS_ASSUME_NONNULL_END
