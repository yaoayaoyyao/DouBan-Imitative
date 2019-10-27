//
//  DBIHomePageManager.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/25.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomePageManager.h"

static DBIHomePageManager *manager = nil;

@implementation DBIHomePageManager

+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [DBIHomePageManager new];
        });
    }
    return manager;
}

- (void)hotNetworkRequestSuccess:(DBIHomePageHandle)succeedBlock error:(ErrorHandle)errorBlock {
    NSString *hotHomeURLStr = [NSString stringWithFormat:@"https://douban-api-git-master.zce.now.sh/v2/movie/in_theaters"];
    NSURL *hotHomeURL = [NSURL URLWithString:hotHomeURLStr];
    NSURLRequest *hotHomeRequest = [NSURLRequest requestWithURL:hotHomeURL];
    NSURLSession *hotHomeSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *hotHomeDataTask = [hotHomeSession dataTaskWithRequest:hotHomeRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            DBIHomeModel *hotHomeModel = [[DBIHomeModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(hotHomeModel);
        } else {
            errorBlock(error);
        }
    }];
    [hotHomeDataTask resume];
}

- (void)willNetworkRequestSuccess:(DBIHomePageHandle)succeedBlock error:(ErrorHandle)errorBlock {
    NSString *willHomeURLStr = [NSString stringWithFormat:@"https://douban-api-git-master.zce.now.sh/v2/movie/coming_soon"];
    NSURL *willHomeURL = [NSURL URLWithString:willHomeURLStr];
    NSURLRequest *willHomeRequest = [NSURLRequest requestWithURL:willHomeURL];
    NSURLSession *willHomeSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *willHomeDataTask = [willHomeSession dataTaskWithRequest:willHomeRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            DBIHomeModel *willHomeModel = [[DBIHomeModel alloc] initWithDictionary:resultDic error:&error];
            succeedBlock(willHomeModel);
        } else {
            errorBlock(error);
        }
    }];
    [willHomeDataTask resume];
}

@end
