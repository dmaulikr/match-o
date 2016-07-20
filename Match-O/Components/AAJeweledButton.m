//
//  AAJeweledButton.m
//  Match-O
//
//  Created by Andres Aguilar on 6/25/16.
//  Copyright © 2016 Andres Aguilar. All rights reserved.
//

#import "AAJeweledButton.h"
#import "UIColor+LightAndDark.h"

const float LINE_WIDTH = 0.5;
const float SEPARATION = 8.0;

@interface AAJeweledButton()

@property (nonatomic, strong) UIColor *baseColor;


@end

@implementation AAJeweledButton

- (void)awakeFromNib
{
    [super awakeFromNib];
    //Redraw views when orientation changes
    self.baseColor = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
    [self setContentMode: UIViewContentModeRedraw];
}

//Designated initializer if button is created by code
- (instancetype)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if(self)
    {
        if(color)
            self.baseColor = color;
        self.backgroundColor = [UIColor clearColor];
        [self setContentMode: UIViewContentModeRedraw];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGSize currentFrame = self.frame.size;
    
    //Upper Rectangle
    [self drawRectangleFromPoint:CGPointMake(SEPARATION, 1)
                    toFirstPoint:CGPointMake(currentFrame.width-SEPARATION,1)
                   toSecondPoint:CGPointMake(currentFrame.width-SEPARATION,SEPARATION)
                    toThirdPoint:CGPointMake(SEPARATION,SEPARATION)
                   withFillColor:[self.baseColor lighterColor]
                      isTriangle:NO];
    
    //Middle rectangle
    [self drawRectangleFromPoint:CGPointMake(SEPARATION, SEPARATION)
                    toFirstPoint:CGPointMake(currentFrame.width-SEPARATION,SEPARATION)
                   toSecondPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-SEPARATION)
                    toThirdPoint:CGPointMake(SEPARATION,currentFrame.height-SEPARATION)
                   withFillColor:self.baseColor
                      isTriangle:NO];
    
    //Bottom rectangle
    [self drawRectangleFromPoint:CGPointMake(SEPARATION, currentFrame.height-SEPARATION)
                    toFirstPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-SEPARATION)
                   toSecondPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-1)
                    toThirdPoint:CGPointMake(SEPARATION,currentFrame.height-1)
                   withFillColor:[self.baseColor darkerColor]
                      isTriangle:NO];
    
    //Left rectangle
    [self drawRectangleFromPoint:CGPointMake(1, SEPARATION)
                    toFirstPoint:CGPointMake(SEPARATION,SEPARATION)
                   toSecondPoint:CGPointMake(SEPARATION,currentFrame.height-SEPARATION)
                    toThirdPoint:CGPointMake(1,currentFrame.height-SEPARATION)
                   withFillColor:[self.baseColor lighterColor]
                      isTriangle:NO];
    
    //Right rectangle
    [self drawRectangleFromPoint:CGPointMake(currentFrame.width-SEPARATION, SEPARATION)
                    toFirstPoint:CGPointMake(currentFrame.width,SEPARATION)
                   toSecondPoint:CGPointMake(currentFrame.width,currentFrame.height-SEPARATION)
                    toThirdPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-SEPARATION)
                   withFillColor:[self.baseColor darkerColor]
                      isTriangle:NO];
    
    //UpperLeft triangle
    [self drawRectangleFromPoint:CGPointMake(1, SEPARATION)
                    toFirstPoint:CGPointMake(SEPARATION,1)
                   toSecondPoint:CGPointMake(SEPARATION,SEPARATION)
                    toThirdPoint:CGPointMake(0,0)
                   withFillColor:[self.baseColor lighterColor]
                      isTriangle:YES];
    
    //UpperRight triangle
    [self drawRectangleFromPoint:CGPointMake(currentFrame.width, SEPARATION)
                    toFirstPoint:CGPointMake(currentFrame.width-SEPARATION,1)
                   toSecondPoint:CGPointMake(currentFrame.width-SEPARATION,SEPARATION)
                    toThirdPoint:CGPointMake(0,0)
                   withFillColor:[self.baseColor lighterColor]
                      isTriangle:YES];
  
    //BottomLeft triangle
    [self drawRectangleFromPoint:CGPointMake(1,currentFrame.height-SEPARATION)
                    toFirstPoint:CGPointMake(SEPARATION,currentFrame.height-1-SEPARATION)
                   toSecondPoint:CGPointMake(SEPARATION,currentFrame.height-1)
                    toThirdPoint:CGPointMake(0,0)
                   withFillColor:[self.baseColor darkerColor]
                      isTriangle:YES];
    
    //BottomRight triangle
    [self drawRectangleFromPoint:CGPointMake(currentFrame.width,currentFrame.height-SEPARATION)
                    toFirstPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-1-SEPARATION)
                   toSecondPoint:CGPointMake(currentFrame.width-SEPARATION,currentFrame.height-1)
                    toThirdPoint:CGPointMake(0,0)
                   withFillColor:[self.baseColor darkerColor]
                      isTriangle:YES];
}

-(void) drawRectangleFromPoint:(CGPoint)originPoint
                  toFirstPoint:(CGPoint)firstPoint
                 toSecondPoint:(CGPoint)secondPoint
                  toThirdPoint:(CGPoint)thirdPoint
                     withFillColor:(UIColor *)fillColor
                    isTriangle:(BOOL)isTriangle
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = LINE_WIDTH;
    
    [path moveToPoint:originPoint];
    
    [path addLineToPoint:firstPoint];
    [path addLineToPoint:secondPoint];
    if(isTriangle)
    {
        path.lineJoinStyle = kCGLineJoinMiter;
        path.miterLimit = -10;
    }else
    {
        [path addLineToPoint:thirdPoint];
    }
    
    [path closePath];
    [fillColor setFill];
    [path fill];
    //[path stroke];

}



@end
