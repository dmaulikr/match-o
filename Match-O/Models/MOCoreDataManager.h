//
//  MOCoreDataManager.h
//  Match-O
//
//  Created by Andres Aguilar on 7/17/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MOUser.h"

@interface MOCoreDataManager : NSObject

+ (instancetype)sharedManager;

@end
