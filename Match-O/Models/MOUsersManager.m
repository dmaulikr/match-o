//
//  MOUsersManager.m
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOUsersManager.h"

@interface MOUsersManager ()

@property (strong, nonatomic) MOHTTPUsersManager *httpUserManager;

@end

@implementation MOUsersManager

+ (instancetype)sharedManager
{
    static MOUsersManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[MOUsersManager alloc] init];
    });
    return _sharedManager;
}

- (void) loginWithUsername:(NSString *)username password:(NSString *)password
{
    self.httpUserManager = [[MOHTTPUsersManager alloc] init];
    self.httpUserManager.delegate = self;
    [self.httpUserManager loginServiceWithUsername:username password:password];
}

#pragma mark - MOHTTPUsersDelegate methods
- (void) usersManagerDidLogin:(NSDictionary *)response
{
    
}

- (void)usersManagerDidFailWithError:(NSError *)error
{
    
}

@end
