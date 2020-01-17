//
//  UIImage+Extends.m
//  SFCustomButton
//
//  Created by LUCA on 2020/01/17.
//  Copyright © 2020 LUCA. All rights reserved.
//

#import "UIImage+Extends.h"

@implementation UIImage (Extends)
- (UIImage * _Nonnull)ai_imageWithGradientTintColor:(UIColor * _Nonnull)tintColor {
    return [self ai_imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}

- (UIImage * _Nonnull)ai_imageWithTintColor:(UIColor * _Nonnull)tintColor blendMode:(CGBlendMode)blendMode {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}
@end
