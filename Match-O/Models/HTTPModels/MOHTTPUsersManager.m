//
//  MOHTTPUsersManager.m
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOHTTPUsersManager.h"
#import "MOHTTPSessionManager.h"

static NSString *const UsersPath = @"api/matchoUsers";

@interface MOHTTPUsersManager()

@property (strong, nonatomic) MOHTTPSessionManager *sessionManager;

@end

@implementation MOHTTPUsersManager

- (id) init
{
    self = [super init];
    if(self)
    {
        _sessionManager = [MOHTTPSessionManager sharedInstance];
    }
    
    return self;
}

- (void) loginServiceWithUsername:(NSString *)username password:(NSString *)password
{
    
    [self.sessionManager POST:[NSString stringWithFormat:@"%@/login", UsersPath]
        parameters:@{@"username": username, @"password": password}
        progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"%@",(NSDictionary*)responseObject);
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",(NSError*)error);
        }
     ];
}

@end
