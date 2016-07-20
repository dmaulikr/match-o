//
//  MOHTTPUsersManager.h
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MOHTTPUsersManagerDelegate;

@interface MOHTTPUsersManager : NSObject

@property (weak, nonatomic) id <MOHTTPUsersManagerDelegate> delegate;

- (void) loginServiceWithUsername:(NSString *)username password:(NSString *)password;

@end

@protocol MOHTTPUsersManagerDelegate <NSObject>

@optional
- (void) usersManagerDidLogin:(NSDictionary *)response;
- (void) usersManagerDidFailWithError:(NSError*)error;

@end