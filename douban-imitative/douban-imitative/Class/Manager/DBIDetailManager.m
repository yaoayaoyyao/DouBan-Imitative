//
//  DBIDetailManager.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailManager.h"

static DBIDetailManager *manager = nil;

@implementation DBIDetailManager

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [DBIDetailManager new];
        });
    }
    return manager;
}

- (void)hotDetailNetworkWithID:(NSString *)ID Success:(DBIDetailHandel)succeedBlock error:(ErrorHandle)errorBlock {
    NSString *hotListIDURLStr = [NSString stringWithFormat:@"https://douban-api-git-master.zce.now.sh/v2/movie/subject/%@", ID];
    NSURL *hotListIDURL = [NSURL URLWithString:hotListIDURLStr];
    NSURLRequest *hotListIDRequest = [NSURLRequest requestWithURL:hotListIDURL];
    NSURLSession *hotListIDSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *hotListIDDataTask = [hotListIDSession dataTaskWithRequest:hotListIDRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            DBIDetailModel *hotListIDModel = [[DBIDetailModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(hotListIDModel);
        } else {
            errorBlock(error);
        }
    }];
    [hotListIDDataTask resume];
}

@end
