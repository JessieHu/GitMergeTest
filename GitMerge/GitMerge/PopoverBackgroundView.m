//
//  PopoverBackgroundView.m
//  GitMerge
//
//  Created by Jessie on 2017/8/18.
//  Copyright © 2017年 Jessie. All rights reserved.
//

#import "PopoverBackgroundView.h"

@implementation PopoverBackgroundView

@synthesize arrowDirection  = _arrowDirection;
@synthesize arrowOffset     = _arrowOffset;

+ (CGFloat)arrowBase
{
    return 12;
}

+ (CGFloat)arrowHeight
{
    return 6;
}
+ (UIEdgeInsets)contentViewInsets{
    return UIEdgeInsetsMake(8, 8, 0, 20);
}

// Custom setters

// Whenever arrow changes direction or position layout subviews
// will be called in order to update arrow and backgorund images frames

//- (void)setArrowOffset:(CGFloat)arrowOffset
//{
//    self.arrowOffset = arrowOffset;
//    [self setNeedsLayout];
//}
//
//- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
//{
//    self.arrowDirection = arrowDirection;
//    [self setNeedsLayout];
//}

+ (BOOL)wantsDefaultContentAppearance
{
    return NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgView = [[UIView alloc] init];
        self.bgView.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.bgView];
        self.bgView.layer.cornerRadius = 8;
        
        self.arrowImageView = [[UIImageView alloc] init];
        [self addSubview:self.arrowImageView];
    }
    return self;
}

- (UIImage *)drawArrowImage:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor clearColor] setFill];
    CGContextFillRect(ctx, CGRectMake(0.0f, 0.0f, size.width, size.height));
    CGMutablePathRef arrowPath = CGPathCreateMutable();
    CGPathMoveToPoint(arrowPath, NULL, (size.width/2.0f), 0.0f);
    CGPathAddLineToPoint(arrowPath, NULL, size.width, size.height);
    CGPathAddLineToPoint(arrowPath, NULL, 0.0f, size.height);
    CGPathCloseSubpath(arrowPath);
    CGContextAddPath(ctx, arrowPath);
    CGPathRelease(arrowPath);
    UIColor *fillColor = [UIColor yellowColor];
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextDrawPath(ctx, kCGPathFill);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize arrowSize = CGSizeMake([[self class] arrowBase], [[self class] arrowHeight]);
    self.arrowImageView.image = [self drawArrowImage:arrowSize];
    self.arrowImageView.frame = CGRectMake(((self.bounds.size.width - arrowSize.width - 12)), 0.0f, arrowSize.width, arrowSize.height);
    self.bgView.frame = CGRectMake(0, CGRectGetMaxY(self.arrowImageView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)-CGRectGetMaxY(self.arrowImageView.frame));
}

@end
