//
//  MOCoreDataManager.m
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "MOCoreDataManager.h"
#import "AppDelegate.h"

static NSString *const MOUserModelName = @"MOUser";

@interface MOCoreDataManager()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation MOCoreDataManager

+ (instancetype)sharedManager
{
    static MOCoreDataManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    ;
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
    }
    return self;
}

#pragma mark - Context
- (BOOL) saveContext
{
    NSError *error;
    if (![self.context save:&error]) {
        NSLog(@"%@",error.userInfo);
        return NO;
    }else {
        return YES;
    }
}

#pragma mark - MOUser
- (MOUser *) fetchUser
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:MOUserModelName];
    NSError *error = nil;
    NSArray *results = [self.context executeFetchRequest:fetchRequest error:&error];
    if (!error) {
        if ([results count]>0) {
            return [results objectAtIndex:0];
        }else {
            return nil;
        }
    }else {
        return nil;
    }
}

- (void) deleteUser:(MOUser *) user
{
    [self.context deleteObject:user];
    [self saveContext];
}

@end
