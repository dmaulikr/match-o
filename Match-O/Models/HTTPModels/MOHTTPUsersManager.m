//
//  MOHTTPUsersManager.m
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOHTTPUsersManager.h"
#import "MOHTTPSessionManager.h"

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
    
}

@end
