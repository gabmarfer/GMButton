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

@implementation UIColor (Additions)
/**
 * Modify the brightness of a color to make it lighter
 *
 * @param
 * @return UIColor the modified color
 */
- (UIColor *)lighterColor
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.3, 1.0)
                               alpha:a];
    return nil;
}

/**
 * Modify the brightness of a color to make it darker
 *
 * @param percentage A CGFloat between 0.0 and 1.0 indicating how much darker should be
 * @return UIColor the modified color
 */
- (UIColor *)darkerColorWithPercentage:(CGFloat)percentage
{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * percentage
                               alpha:a];
    return nil;
}
@end

@interface GMButton ()
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *highlightColor;
@property (nonatomic, strong) UIColor *disabledColor;
@property (nonatomic, strong) UIActivityIndicatorView *spinner;
@end

@implementation GMButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self p_setupButton];
    }
    return self;
}

- (void)awakeFromNib
{
    [self p_setupButton];
}

- (void)p_setupButton
{
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [[self spinner] setHidesWhenStopped:YES];
    
    // Round corners
    [[self layer] setCornerRadius:8.0f];
    [[self layer] setMasksToBounds:YES];
    
    // Set a border
    //[[self layer] setBorderWidth:0.4f];
    //UIColor *borderColor = [UIColor colorWithRed:160/255.0f green:160/255.0f blue:160/255.0f alpha:1.0f]; /* #a0a0a0 */
    //[[self layer] setBorderColor:[borderColor CGColor]];
    
    // Set a default color
    [self setButtonColor:GMButtonColorYellow];
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
    // Set base colors (normal state) and text colors
    switch (aColor) {
        case GMButtonColorYellow:
        {
            [self setNormalColor:[UIColor ownNormalYellowColor]];
            [self setButtonTextColor:[UIColor ownDarkGreenColor]];
            // Set highlighted and disabled colors
            self.highlightColor = [[self normalColor] darkerColorWithPercentage:0.50];
            self.disabledColor = [[self normalColor] darkerColorWithPercentage:0.75];
        }
            break;
        case GMButtonColorGreen:
        {
            [self setNormalColor:[UIColor ownDarkGreenColor]];
            [self setButtonTextColor:[UIColor whiteColor]];
            // Set highlighted and disabled colors
            self.highlightColor = [[self normalColor] darkerColorWithPercentage:0.50];
            self.disabledColor = [[self normalColor] darkerColorWithPercentage:0.75];
        }
            break;
        case GMButtonColorBlack:
        {
            [self setNormalColor:[UIColor ownDarkGrayColor]];
            [self setButtonTextColor:[UIColor ownNormalGrayColor]];
            // Set highlighted and disabled colors
            self.highlightColor = [UIColor blackColor];
            self.disabledColor = [UIColor ownDisabledGrayColor];
        }
            break;
        case GMButtonColorWhite:
        {
            self.normalColor = [UIColor whiteColor];
            [self setButtonTextColor:[UIColor ownDarkGreenColor]];
            // Set highlighted and disabled colors
            self.highlightColor = [UIColor ownLightGrayColor];
            self.disabledColor = [UIColor ownDisabledGrayColor];
        }
            break;
    }
    [self setBackgroundColor:self.normalColor];
}

- (void)setButtonTextColor:(UIColor *)aColor
{
    // Set text colors
    [self setTitleColor:aColor forState:UIControlStateNormal];
    [self setTitleColor:aColor forState:UIControlStateHighlighted];
    [self setTitleColor:aColor forState:UIControlStateSelected];
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

#pragma mark - Additional methods
/**
 * Add an UIActivityIndicatorView as a subview of the button. The spinner will be placed
 * to the right of the title
 *
 * @param
 * @return
 */
- (void)addSpinner
{
    [[self spinner] setColor:[UIColor ownDarkGrayColor]];
    CGRect btnFrame = [self frame];
    CGFloat marginRight = 30.0f;
    CGFloat spinnerSize = 20.0f;
    [[self spinner] setFrame:CGRectMake(btnFrame.size.width - marginRight - spinnerSize, 8.0f, spinnerSize, spinnerSize)];
    [self addSubview:[self spinner]];
}

/**
 * Start animating the spinner added as subview of the button
 *
 * @param
 * @return
 */
- (void)startAnimating
{
    dispatch_async(dispatch_get_main_queue(), ^{
            [[self spinner] startAnimating];
    });
}

/**
 * Stop animating the spinner added as subview of the button
 *
 * @param
 * @return
 */
- (void)stopAnimating
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([[self spinner] isAnimating])
            [[self spinner] stopAnimating];
    });
}


@end
