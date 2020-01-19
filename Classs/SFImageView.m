//
//  AIImageView.m
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#import "SFImageView.h"
#import "UIImage+Extends.h"

@implementation SFImageView

#pragma mark -
#pragma mark -
- (void)setEnabled:(BOOL)enabled {
    if(enabled) {
        if(_status == SFCustomStatus_Disabled) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }else {
        self.status = SFCustomStatus_Disabled;
    }
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    if(highlighted) {
        self.status = SFCustomStatus_Highlighted;
    }else {
        if(_status == SFCustomStatus_Highlighted) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }
}


- (void)setStatus:(SFCustomStatus)status {
    _status = status;
    switch (status) {
        case SFCustomStatus_Normal: {
            self.image = self.normalImage;
        } break;
        case SFCustomStatus_Selected: {
            self.image = self.selectedImage;
        } break;
        case SFCustomStatus_Disabled: {
            self.image = self.disabledImage;
        } break;
        case SFCustomStatus_Highlighted: {
            self.image = [self getHighlightedImage];
        } break;
        default: {
            self.image = self.normalImage;
        }break;
    }
}

#pragma mark -
#pragma mark -LazyPropertys
- (UIImage *)normalImage {
    if(_normalImage) {
        UIImage *image = _normalImage;
        if(_imageNormalColor) {
            return [image ai_imageWithGradientTintColor:_imageNormalColor];
        }else {
            return image;
        }
    }
    return nil;
}

- (UIImage *)selectedImage {
    if(_selectedImage) {
        UIImage *image = _selectedImage;
        if(_imageSelectedColor) {
            return [image ai_imageWithGradientTintColor:_imageSelectedColor];
        }else {
            return image;
        }
    }else {
        return self.normalImage;
    }
}

- (UIImage *)disabledImage {
    if(_selectedImage) {
        UIImage *image = _disabledImage;
        if(_imageDisabledColor) {
            return [image ai_imageWithGradientTintColor:_imageDisabledColor];
        }else {
            return image;
        }
    }else {
        return self.normalImage;
    }
}

- (UIImage *)getHighlightedImage {
    if(self.highlightedImage) {
        return self.highlightedImage;
    }else {
        return self.normalImage;
    }
}

/// normal/selected/disabled. can return nil
- (UIImage *)currentImage {
    switch (_status) {
        case SFCustomStatus_Normal: {
            return self.normalImage;
        } break;
        case SFCustomStatus_Selected: {
            return self.selectedImage;
        } break;
        case SFCustomStatus_Disabled: {
            return self.disabledImage;
        } break;
        case SFCustomStatus_Highlighted: {
            return [self getHighlightedImage];
        } break;
        default: {
            return nil;
        }break;
    }
}
/*
 image = [image ai_imageWithGradientTintColor:_imageNormalColor];
 */
@end
