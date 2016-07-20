//
//  UIColor+LIghtDarkColor.m
//  Match-O
//
//  Created by Andres Aguilar on 6/25/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "UIColor+LightAndDark.h"

@implementation UIColor(LightAndDark)

- (UIColor *)darkerColor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.75
                               alpha:a];
    return nil;
}

- (UIColor *)lighterColor {
    CGFloat h,s,b,a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a]) {
        return [UIColor colorWithHue:h
                          saturation:MAX(s - 0.5, 0.0)
                          brightness:b
                               alpha:a];
    }
    return nil;

}
@end
