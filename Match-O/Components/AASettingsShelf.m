//
//  AASettingsShelf.m
//  Match-O
//
//  Created by Andres Aguilar on 6/20/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "AASettingsShelf.h"

@interface AASettingsShelf()

    @property (nonatomic, strong) NSNumber* navBarOffset;
    @property (nonatomic, strong) NSLayoutConstraint *offsetConstraint;

@end

@implementation AASettingsShelf

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initShelf];
}

-(void) initShelf
{
    //Setting the flag to YES will close the shelf when toggleShelf is called
    self.open = YES;
    
    [self calculateOffset];
    [self findOffsetConstraint];
    [self toggleShelf:NO];
}

-(void) calculateOffset
{
    UIViewController *superviewController;
    if([[self.superview nextResponder] isKindOfClass:[UIViewController class]])
    {
         superviewController = (UIViewController *)[self.superview nextResponder];
    }
    CGFloat statusBarHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    //If we can't get the navigation bar, we assume it doesn't exist.
    if(superviewController == nil || superviewController.navigationController.navigationBar ==nil)
    {
        self.navBarOffset = 0;
    }else
    {
        self.navBarOffset = [NSNumber numberWithFloat:superviewController.navigationController.navigationBar.frame.size.height + statusBarHeight];
    }
    
    
}

-(void) findOffsetConstraint
{
    //Will only work if view is connected to super view through top attribute
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        //Checking if property has top or top margin attributes
        if((constraint.firstAttribute == NSLayoutAttributeTop || constraint.firstAttribute == NSLayoutAttributeTopMargin ) && (constraint.secondAttribute == NSLayoutAttributeTop || constraint.secondAttribute == NSLayoutAttributeTopMargin) )
        {
            self.offsetConstraint = constraint;
            break;
        }
    }
    
    
    //If attribute is TopMargin, change it to Top only. If view is constrained to Top margin, change it to superview
    if(self.offsetConstraint && (self.offsetConstraint.firstAttribute == NSLayoutAttributeTopMargin || self.offsetConstraint.secondAttribute == NSLayoutAttributeTopMargin || self.offsetConstraint.secondItem != self.superview))
    {
        NSLayoutConstraint *newConstraint = [NSLayoutConstraint constraintWithItem: self
                                                                         attribute: NSLayoutAttributeTop
                                                                         relatedBy: self.offsetConstraint.relation
                                                                            toItem: self.superview
                                                                         attribute: NSLayoutAttributeTop
                                                                        multiplier: self.offsetConstraint.multiplier
                                                                          constant: self.offsetConstraint.constant];
        //Remove old constraint and place the new one
        [self.superview removeConstraint:self.offsetConstraint];
        self.offsetConstraint = newConstraint;
        [self.superview addConstraint: self.offsetConstraint];
        [self.superview setNeedsUpdateConstraints];
    }
}

-(void) toggleShelf:(BOOL)animated
{
    if(animated)
    {
        [self.superview layoutIfNeeded];
        [UIView animateWithDuration:0.7 animations:^{
            // Make all constraint changes here
            [self updateOffsetConstraint];
            [self.superview layoutIfNeeded];
            self.open = !self.open;
        }];
    }else
    {
        [self updateOffsetConstraint];
        [self.superview layoutIfNeeded];
        self.open = !self.open;
    }
    
}

-(void) updateOffsetConstraint
{
    self.offsetConstraint.constant = ([self isOpen]) ? [self.navBarOffset  floatValue] - self.frame.size.height : [self.navBarOffset floatValue];
}

@end
