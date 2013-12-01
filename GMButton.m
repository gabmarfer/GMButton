//
//  GMButton.m
//
//
//  Created by Gabi Martelo on 01/12/13.
//
//  Copyright (c) 2013 Startcapps. All rights reserved.
//

#import "GMButton.h"
#import <QuartzCore/QuartzCore.h>

@interface GMButton ()
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;
@property (nonatomic, strong) UIColor *disabledColor;
@end

@implementation GMButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Round corners for iOS 6 buttons
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (systemVersion < 7.0f)
    {
        [[self layer] setCornerRadius:8.0f];
        [[self layer] setMasksToBounds:YES];
    }
    
    // Set a border
    [[self layer] setBorderWidth:0.4f];
    UIColor *borderColor = [UIColor colorWithRed:160/255.0f green:160/255.0f blue:160/255.0f alpha:1.0f]; /* #a0a0a0 */
    [[self layer] setBorderColor:[borderColor CGColor]];
    
    // Set a default color
    [self setButtonColor:GMButtonColorBlue];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)setButtonColor:(GMButtonColor)aColor
{
    switch (aColor) {
        case GMButtonColorBlue:
        {
            self.normalColor = [UIColor colorWithRed:0/255.0f green:50/255.0f blue:136/255.0f alpha:1.0f]; /* #003288 */
            self.highlightColor = [UIColor colorWithRed:0/255.0f green:36/255.0f blue:99/255.0f alpha:1.0f]; /* #002463 */
            self.disabledColor = [UIColor colorWithRed:0/255.0f green:27/255.0f blue:73/255.0f alpha:1.0f];; /* 001b49 */
        }
            break;
        case GMButtonColorGreen:
        {
            self.normalColor = [UIColor colorWithRed:13/255.0f green:178/255.0f blue:29/255.0f alpha:1.0f]; /* #0db21d */
            self.highlightColor = [UIColor colorWithRed:9/255.0f green:134/255.0f blue:21/255.0f alpha:1.0f]; /* #098615 */
            self.disabledColor = [UIColor colorWithRed:5/255.0f green:71/255.0f blue:11/255.0f alpha:1.0f]; /* #05470b */
        }
            break;
        case GMButtonColorGray:
        {
            self.normalColor = [UIColor colorWithRed:114/255.0f green:114/255.0f blue:114/255.0f alpha:1.0f]; /* #727272 */
            self.highlightColor = [UIColor colorWithRed:83/255.0f green:83/255.0f blue:83/255.0f alpha:1.0f]; /* #535353 */
            self.disabledColor = [UIColor colorWithRed:44/255.0f green:44/255.0f blue:44/255.0f alpha:1.0f]; /* #2c2c2c */
        }
            break;
        case GMButtonColorRed:
        {
            self.normalColor = [UIColor colorWithRed:238/255.0f green:15/255.0f blue:18/255.0f alpha:1.0f]; /* #ee0f12 */
            self.highlightColor = [UIColor colorWithRed:165/255.0f green:8/255.0f blue:9/255.0f alpha:1.0f]; /* #a50809 */
            self.disabledColor = [UIColor colorWithRed:172/255.0f green:8/255.0f blue:10/255.0f alpha:1.0f]; /* #ac080a */
        }
            break;
    }
    
    [self setBackgroundColor:self.normalColor];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    if (highlighted)
        [self setBackgroundColor:self.highlightColor];
    else
        [self setBackgroundColor:self.normalColor];
    
    [self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (selected)
        [self setBackgroundColor:self.highlightColor];
    else
        [self setBackgroundColor:self.normalColor];
    
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    if (enabled)
        [self setBackgroundColor:self.normalColor];
    else
        [self setBackgroundColor:self.disabledColor];

    
    [self setNeedsDisplay];
}

@end
