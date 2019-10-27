//
//  DBIHomeModel.h
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/25.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DBIRatingModel

@end

@protocol DBIImagesModel

@end

@protocol DBISubjectsModel

@end

@interface DBIRatingModel : JSONModel

@property (nonatomic) float average;

@end

@interface DBIImagesModel : JSONModel

@property (nonatomic) NSString *small;

@end

@interface DBISubjectsModel : JSONModel

@property (nonatomic) DBIRatingModel *rating;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *mainland_pubdate;
@property (nonatomic) DBIImagesModel *images;

@end

@interface DBIHomeModel : JSONModel

@property (nonatomic, copy) NSArray<DBISubjectsModel> *subjects;

@end

NS_ASSUME_NONNULL_END
