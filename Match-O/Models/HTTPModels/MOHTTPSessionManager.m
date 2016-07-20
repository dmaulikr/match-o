//
//  MOBaseWSModel.m
//  Match-O
//
//  Created by Andres Aguilar on 7/4/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOHTTPSessionManager.h"

static NSString *const AABaseURL = @"https://macho-aaguilar-ssf.c9users.io/api/";

@implementation MOHTTPSessionManager

+ (instancetype)sharedInstance
{
    static MOHTTPSessionManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[MOHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:AABaseURL] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    });
    return _sharedInstance;
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(nullable NSURLSessionConfiguration *)configuration
{
    self  = [super initWithBaseURL:url sessionConfiguration:configuration];
    if(self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    return self;
}


@end
