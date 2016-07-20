//
//  MOBaseWSModel.h
//  Match-O
//
//  Created by Andres Aguilar on 7/4/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface MOHTTPSessionManager: AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
