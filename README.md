**GMButton**
==================

A subclass of UIButton valid for iOS6 and iOS7.

In iOS6 the button corners are rounded. In iOS7 the button is a rectangle like sytem buttons.

**Usage**
-----------------
Create a button in a XIB file, set its type to Custom and change its class to GMButton. Then, in the viewDidLoad method of the ViewController, call the method setButtonColor to set the button color.

```objc  
// Call to set the color of the button
[[self btnDoSomething] setButtonColor:GMButtonColorBlue];
```

**Available colors**
+GMButtonColorBlue
+GMButtonColorGreen
+GMButtonColorGray
+GMButtonColorRed
