//
//  MOUser+CoreDataProperties.h
//  
//
//  Created by Andres Aguilar on 7/17/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MOUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *username;
@property (nullable, nonatomic, retain) NSString *email;

@end

NS_ASSUME_NONNULL_END
