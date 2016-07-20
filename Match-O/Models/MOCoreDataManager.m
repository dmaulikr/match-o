//
//  MOCoreDataManager.m
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOCoreDataManager.h"
#import "AppDelegate.h"

@interface MOCoreDataManager()

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) MOUser *user;
@property (strong, nonatomic) NSEntityDescription *userEntityDescription;

@end

@implementation MOCoreDataManager

+ (instancetype)sharedManager
{
    static MOCoreDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedManager = [[MOCoreDataManager alloc] init];
    });
    return _sharedManager;
}


- (id) init
{
    self = [super init];
    if(self)
    {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        _context = [appDelegate managedObjectContext];
        _userEntityDescription = [NSEntityDescription entityForName:@"MOUser" inManagedObjectContext:_context];
    }
    return self;
}
@end
