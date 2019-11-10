//
//  DBIDetailManager.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/11/10.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIDetailManager.h"

static DBIListPageManager *manager = nil;

@implementation DBIDetailManager

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [DBIListPageManager new];
        });
    }
    return manager;
}

- (void)hotListNetworkSuccess:(DBIListHotHandle)succeedBlock error:(ErrorHandle)errorBlock {
    NSString *hotListURLStr = [NSString stringWithFormat:@"https://douban-api-git-master.zce.now.sh/v2/movie/in_theaters"];
    NSURL *hotListURL = [NSURL URLWithString:hotListURLStr];
    NSURLRequest *hotListRequest = [NSURLRequest requestWithURL:hotListURL];
    NSURLSession *hotListSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *hotListDataTask = [hotListSession dataTaskWithRequest:hotListRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            DBIListHotModel *hotListModel = [[DBIListHotModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(hotListModel);
        } else {
            errorBlock(error);
        }
    }];
    [hotListDataTask resume];
}

- (void)hotListNetworkWithID:(NSString *)ID Success:(DBIListHotIDHandle)succeedBlock error:(ErrorHandle)errorBlock {
    NSString *hotListIDURLStr = [NSString stringWithFormat:@"https://douban-api-git-master.zce.now.sh/v2/movie/subject/%@", ID];
    NSURL *hotListIDURL = [NSURL URLWithString:hotListIDURLStr];
    NSURLRequest *hotListIDRequest = [NSURLRequest requestWithURL:hotListIDURL];
    NSURLSession *hotListIDSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *hotListIDDataTask = [hotListIDSession dataTaskWithRequest:hotListIDRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            DBIListHotIDModel *hotListIDModel = [[DBIListHotIDModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(hotListIDModel);
        } else {
            errorBlock(error);
        }
    }];
    [hotListIDDataTask resume];
}

@end
