//
//  MOUsersManager.h
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOHTTPUsersManager.h"
#import "MOCoreDataManager.h"
#import "MOUser.h"

@protocol MOUsersManagerDelegate;

@interface MOUsersManager : NSObject <MOHTTPUsersManagerDelegate>

+ (instancetype)sharedManager;

@property (weak, nonatomic) id <MOUsersManagerDelegate> delegate;

- (void) loginWithUsername:(NSString *)username password:(NSString *)password;

@end

@protocol MOUsersManagerDelegate <NSObject>

@optional
- (void) userDidLogin:(BOOL)success;


@end