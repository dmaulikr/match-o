//
//  MOUsersManager.h
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOHTTPUsersManager.h"
#import "MOUser.h"

@interface MOUsersManager : NSObject <MOHTTPUsersManagerDelegate>

+ (instancetype)sharedManager;

- (void) loginWithUsername:(NSString *)username password:(NSString *)password;

@end
