//
//  GMButton.h
//
//
//  Created by Gabi Martelo on 01/12/13.
//
//  Copyright (c) 2013 Startcapps. All rights reserved.
//
// USAGE: Create a button in a XIB file, set its type to Custom and change its class to GMButton
//        Then, in the viewDidLoad method of the ViewController, call the
//        method setButtonColor to set the button color

#import <UIKit/UIKit.h>

@interface UIColor (Additions)
- (UIColor *)lighterColor;
- (UIColor *)darkerColorWithPercentage:(CGFloat)percentage;
@end

typedef NS_ENUM(NSUInteger, GMButtonColor)
{
    GMButtonColorYellow,
    GMButtonColorGreen,
    GMButtonColorBlack,
    GMButtonColorWhite,
};

@interface GMButton : UIButton

- (void)setButtonColor:(GMButtonColor)aColor;

// Add and manage a Spinner if necessary
- (void)addSpinner;
- (void)startAnimating;
- (void)stopAnimating;
@end
