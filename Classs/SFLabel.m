//
//  AILabel.m
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#import "SFLabel.h"

@implementation SFLabel

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
            self.text = self.normalText;
            self.font = self.normalTextFont;
            self.textColor = self.normalTextColor;
        } break;
        case SFCustomStatus_Selected: {
            self.text = self.selectedText;
            self.font = self.selectedTextFont;
            self.textColor = self.selectTextColor;
        } break;
        case SFCustomStatus_Highlighted: {
            self.text = self.highlightedText;
            self.font = self.highlightedTextFont;
            self.textColor = [self getHighlightedTextColor];
        } break;
        case SFCustomStatus_Disabled: {
            self.text = self.disabledText;
            self.font = self.disabledTextFont;
            self.textColor = self.disabledColor;
        } break;
            
        default: {
            self.text = self.normalText;
            self.font = self.normalTextFont;
            self.textColor = self.normalTextColor;
        }break;
    }
}

#pragma mark -
#pragma mark -LazyPropertys
//color
- (UIColor *)normalTextColor {
    if(_normalTextColor) {
        return _normalTextColor;
    }
    return self.textColor;
}

- (UIColor *)selectTextColor {
    if(_selectedTextColor) {
        return _selectedTextColor;
    }else {
        return self.normalTextColor;
    }
}

- (UIColor *)disabledColor {
    if(_disabledColor) {
        return _disabledColor;
    }else {
        return self.normalTextColor;
    }
}

- (UIColor *)getHighlightedTextColor {
    if(self.highlightedTextColor) {
        return self.highlightedTextColor;
    }else {
        return self.normalTextColor;
    }
}

//font
- (UIFont *)normalTextFont {
    if(_normalTextFont) {
        return _normalTextFont;
    }else {
        return self.font;
    }
}

- (UIFont *)selectedTextFont {
    if(_selectedTextFont) {
        return _selectedTextFont;
    }else {
        return self.normalTextFont;
    }
}

- (UIFont *)disabledTextFont {
    if(_disabledTextFont) {
        return _disabledTextFont;
    }else {
        return self.normalTextFont;
    }
}

- (UIFont *)highlightedTextFont {
    if(_highlightedTextFont) {
        return _highlightedTextFont;
    }else {
        return self.normalTextFont;
    }
}

//text
- (NSString *)normalText {
    if(_normalText) {
        return _normalText;
    }
    return self.text;
}

- (NSString *)selectedText {
    if(_selectedText) {
        return _selectedText;
    }else {
        return self.normalText;
    }
}

- (NSString *)disabledText {
    if(_disabledText) {
        return _disabledText;
    }else {
        return self.normalText;
    }
}

- (NSString *)highlightedText {
    if(_highlightedText) {
        return _highlightedText;
    }else {
        return self.normalText;
    }
}


#pragma mark -
#pragma mark -System
- (NSString *)currentTitle {
    switch (_status) {
        case SFCustomStatus_Normal: {
            return self.normalText;
        } break;
        case SFCustomStatus_Selected: {
            return self.selectedText;
        } break;
        case SFCustomStatus_Disabled: {
            return self.disabledText;
        } break;
        case SFCustomStatus_Highlighted: {
            return self.highlightedText;
            break;
        }
    }
    return nil;
}

- (UIColor *)currentTitleColor {
    switch (_status) {
        case SFCustomStatus_Normal: {
            return self.normalTextColor;
        } break;
        case SFCustomStatus_Selected: {
            return self.selectTextColor;
        } break;
        case SFCustomStatus_Disabled: {
            return self.disabledColor;
        } break;
        case SFCustomStatus_Highlighted: {
            return [self getHighlightedTextColor];
            break;
        }
    }
    return nil;
}
@end
