//
//  M80PathManager.h
//  M80WifiSync
//
//  Created by amao on 1/12/15.
//  Copyright (c) 2015 www.xiangwangfeng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface M80PathManager : NSObject
+ (instancetype)sharedManager;
- (NSString *)fileStoragePath;
@end
