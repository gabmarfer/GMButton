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

typedef NS_ENUM(NSUInteger, GMButtonColor)
{
    GMButtonColorBlue,
    GMButtonColorGreen,
    GMButtonColorRed,
    GMButtonColorGray,
};

@interface GMButton : UIButton

- (void)setButtonColor:(GMButtonColor)aColor;
@end
