//
//  M80HttpServer.h
//  M80WifiSync
//
//  Created by amao on 1/12/15.
//  Copyright (c) 2015 www.xiangwangfeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M80HttpServer : NSObject
+ (instancetype)sharedServer;
- (void)start;
- (void)stop;

- (NSString *)url;
@end