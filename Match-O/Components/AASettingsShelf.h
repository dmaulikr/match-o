//
//  AASettingsShelf.h
//  Match-O
//
//  Created by Andres Aguilar on 6/20/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AASettingsShelf : UIView


@property (nonatomic, assign, getter=isOpen) BOOL open;

-(void) toggleShelf:(BOOL) animated;

@end
