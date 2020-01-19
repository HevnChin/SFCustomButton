//
//  SFCustomButton.m
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiSFnnovations. All rights reserved.
//

#import "SFCustomButton.h"
#import "SFImageView.h"
#import "SFLabel.h"

@interface SFCustomButton ()
@property (nonatomic, strong) UIStackView *stackView;
///图标
@property (nonatomic, strong) SFImageView *customIconImageView;
///文本
@property (nonatomic, strong) SFLabel *customTextLabel;

//data

///热区
@property (nonatomic, assign) CGSize hotSpotsSize;
@end

@implementation SFCustomButton

#pragma mark -
#pragma mark -LifeCyle

+ (instancetype)buttonWithCustomType:(SFCustomButtonType)buttonType {
    SFCustomButton *button = [super buttonWithType:UIButtonTypeCustom];
    [button _initViews];
    button.type = buttonType;
    return button;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self _initViews];
        self.type = SFCustomButtonType_LeadingTrailing_IconText;
    }
    return self;
}

///默认是左右结构的icon+text(适配阿拉伯语言样式)
+ (instancetype)buttonWithType:(UIButtonType)buttonType {
    return [SFCustomButton buttonWithCustomType:SFCustomButtonType_LeadingTrailing_IconText];
}

- (void)_initViews {
    [self addSubview:self.stackView];
    self.status = SFCustomStatus_Normal;
    
    [self _showInSuperViewWithView:self.stackView];
}

- (void)setType:(SFCustomButtonType)type {
    _type = type;
    switch (_type) {
        case SFCustomButtonType_LeadingTrailing_IconText:{
        } break;
        case SFCustomButtonType_LeadingTrailing_TextIcon:
        {   //切换位置
            [self.stackView removeArrangedSubview:self.customIconImageView];
            [self.stackView addArrangedSubview:self.customIconImageView];
        } break;
        case SFCustomButtonType_TopBottom_IconText:
        {
            //切换方向
            self.stackView.axis = UILayoutConstraintAxisVertical;
        } break;
        case SFCustomButtonType_TopBottom_TextIcon:
        {
            //切换方向&位置
            self.stackView.axis = UILayoutConstraintAxisVertical;
            [self.stackView removeArrangedSubview:self.customIconImageView];
            [self.stackView addArrangedSubview:self.customIconImageView];
        } break;
        case SFCustomButtonType_Text:
        {
            //隐藏-图片
            self.customIconImageView.hidden = YES;
        } break;
        case SFCustomButtonType_Icon:
        {
            //隐藏-文字
            self.customTextLabel.hidden = YES;
        } break;
        default: break;
    }
}

#pragma mark -
#pragma mark -set
///The goal is to center the whole instead of supporting the parent View
- (void)_showInSuperViewWithView:(UIView *)view {
    if(view.superview && view) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
        UIView *superview = view.superview;
        
        ///top
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                 toItem:superview attribute:NSLayoutAttributeTop multiplier:1 constant:0]];
        //Leading
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading
                                                              relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                 toItem:superview attribute:NSLayoutAttributeLeading multiplier:1 constant:0]];
        //Bottom
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationLessThanOrEqual
                                                                 toItem:superview attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];
        //Trailing
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing
                                                              relatedBy:NSLayoutRelationLessThanOrEqual
                                                                 toItem:superview attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
        //CenterX
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:superview attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        //CenterY
        [superview addConstraint:[NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterY
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:superview attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    }
}

- (void)setStatus:(SFCustomStatus)status {
    _status = status;
    self.customTextLabel.status = status;
    self.customIconImageView.status = status;
}

- (void)setIconTextSpacing:(CGFloat)iconTextSpacing {
    _iconTextSpacing = iconTextSpacing;
    self.stackView.spacing = iconTextSpacing;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.status = _status;
}

#pragma mark -
#pragma mark -Public
- (void)zoomHotSpotsToSize:(CGSize)size {
    if (CGSizeEqualToSize(_hotSpotsSize, CGSizeZero)) {//如果热区是0，赋值为默认值
        _hotSpotsSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    }
    
    if (_hotSpotsSize.width < size.width) {
        _hotSpotsSize.width = size.width;
    }
    if (_hotSpotsSize.height < size.height) {
        _hotSpotsSize.height = size.height;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = self.bounds;
    if (CGSizeEqualToSize(_hotSpotsSize, CGSizeZero)) {//如果热区是0，赋值为默认值
        _hotSpotsSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    }
    CGFloat widthDelta = MAX(_hotSpotsSize.width - bounds.size.width, 0);
    CGFloat heightDelta = MAX(_hotSpotsSize.height - bounds.size.height, 0);
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    return CGRectContainsPoint(bounds, point);
}

///设置字体
- (void)setTitleFont:(nullable UIFont *)font forState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            self.customTextLabel.normalTextFont = font;
        }break;
        case UIControlStateSelected: {
            self.customTextLabel.selectedTextFont = font;
        }break;
        case UIControlStateHighlighted: {
            self.customTextLabel.highlightedTextFont = font;
        }break;
        case UIControlStateDisabled: {
            self.customTextLabel.disabledTextFont = font;
        }break;
        default: break;
    }
}

#pragma mark -
#pragma mark -System
- (BOOL)isSelected {
    BOOL is = [super isSelected];
    if(is) {
        self.status = SFCustomStatus_Selected;
    }else {
        if(_status == SFCustomStatus_Selected) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }
    return is;
}

- (BOOL)isEnabled {
    BOOL is = [super isEnabled];
    if(is) {
        if(_status == SFCustomStatus_Disabled) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }else {
        self.status = SFCustomStatus_Disabled;
    }
    return is;
}

- (BOOL)isHighlighted {
    BOOL is = [super isHighlighted];
    if(is) {
        self.status = SFCustomStatus_Highlighted;
    }else {
        if(_status == SFCustomStatus_Highlighted) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }
    return is;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if(selected) {
        self.status = SFCustomStatus_Selected;
    }else {
        if(self.status == SFCustomStatus_Selected) {
            self.status = SFCustomStatus_Normal;
        }else {
            self.status = _status;
        }
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
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
///适配用户的使用
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            self.customTextLabel.normalText = title;
        }break;
        case UIControlStateSelected: {
            self.customTextLabel.selectedText = title;
        }break;
        case UIControlStateHighlighted: {
            self.customTextLabel.highlightedText = title;
        }break;
        case UIControlStateDisabled: {
            self.customTextLabel.disabledText = title;
        }break;
        default:
            break;
    }
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            self.customTextLabel.normalTextColor = color;
        }break;
        case UIControlStateSelected: {
            self.customTextLabel.selectedTextColor = color;
        }break;
        case UIControlStateHighlighted: {
            self.customTextLabel.highlightedTextColor = color;
        }break;
        case UIControlStateDisabled: {
            self.customTextLabel.disabledColor = color;
        }break;
        default:
            break;
    }
}

- (nullable NSString *)titleForState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            return self.customTextLabel.normalText;
        }break;
        case UIControlStateSelected: {
            return self.customTextLabel.selectedText;
        }break;
        case UIControlStateHighlighted: {
            return self.customTextLabel.highlightedText;
        }break;
        case UIControlStateDisabled: {
            return self.customTextLabel.disabledText;
        }break;
        default:{
            return nil;
        }break;
    }
}

- (nullable UIColor *)titleColorForState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            return self.customTextLabel.normalTextColor;
        }break;
        case UIControlStateSelected: {
            return self.customTextLabel.selectedTextColor;
        }break;
        case UIControlStateHighlighted: {
            return self.customTextLabel.highlightedTextColor;
        }break;
        case UIControlStateDisabled: {
            return self.customTextLabel.disabledColor;
        }break;
        default:{
            return nil;
        }break;
    }
}

- (nullable UIImage *)imageForState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            return self.customIconImageView.normalImage;
        }break;
        case UIControlStateSelected: {
            return self.customIconImageView.selectedImage;
        }break;
        case UIControlStateHighlighted: {
            return self.customIconImageView.highlightedImage;
        }break;
        case UIControlStateDisabled: {
            return self.customIconImageView.disabledImage;
        }break;
        default:{
            return nil;
        }break;
    }
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            self.customIconImageView.normalImage = image;
        }break;
        case UIControlStateSelected: {
            self.customIconImageView.selectedImage = image;
        }break;
        case UIControlStateHighlighted: {
            self.customIconImageView.highlightedImage = image;
        }break;
        case UIControlStateDisabled: {
            self.customIconImageView.disabledImage = image;
        }break;
        default:
            break;
    }
}

- (void)setImageResetColor:(UIColor *)color forState:(UIControlState)state {
    switch (state) {
        case UIControlStateNormal: {
            self.customIconImageView.imageNormalColor = color;
        }break;
        case UIControlStateSelected: {
            self.customIconImageView.imageSelectedColor = color;
        }break;
        case UIControlStateHighlighted: {
            
        }break;
        case UIControlStateDisabled: {
            self.customIconImageView.imageDisabledColor = color;
        }break;
        default: break;
    }
}

///当前imageView
- (UIImageView *)imageView {
    return self.customIconImageView;
}

///当前Label
- (UILabel *)titleLabel {
    return self.customTextLabel;
}

/// normal/selected/disabled. can return nil
- (NSString *)currentTitle {
    return self.customTextLabel.currentTitle;
}
/// normal/selected/disabled. always returns non-nil
- (UIColor *)currentTitleColor {
    return self.customTextLabel.currentTitleColor;
}

/// normal/selected/disabled. can return nil
- (UIImage *)currentImage {
    return self.customIconImageView.currentImage;
}

#pragma mark -
#pragma mark -LazyPropertys
- (UIStackView *)stackView {
    if(!_stackView) {
        UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[self.customIconImageView,self.customTextLabel]];
        stackView.axis = UILayoutConstraintAxisHorizontal;
        stackView.alignment = UIStackViewAlignmentCenter;
        stackView.distribution = UIStackViewDistributionFill;
        stackView.spacing = 5;
        stackView.userInteractionEnabled = NO;
        
        CGFloat compressionPriority = 751;
        CGFloat huggingPriority     = 251;
        [stackView setContentCompressionResistancePriority:compressionPriority forAxis:UILayoutConstraintAxisHorizontal];
        [stackView setContentHuggingPriority:huggingPriority forAxis:UILayoutConstraintAxisHorizontal];
        [stackView setContentCompressionResistancePriority:compressionPriority forAxis:UILayoutConstraintAxisVertical];
        [stackView setContentHuggingPriority:huggingPriority forAxis:UILayoutConstraintAxisVertical];

        _stackView = stackView;
    }
    return _stackView;
}

- (SFLabel *)customTextLabel {
    if(!_customTextLabel) {
        SFLabel *label = [[SFLabel alloc] init];
        label.numberOfLines = 1;
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.lineBreakMode = NSLineBreakByTruncatingMiddle;
        label.status = SFCustomStatus_Normal;
        _customTextLabel = label;
    }
    return _customTextLabel;
}

- (SFImageView *)customIconImageView {
    if(!_customIconImageView) {
        _customIconImageView = [[SFImageView alloc] init];
        
        CGFloat compressionPriority = 751;
        CGFloat huggingPriority     = 251;
        [_customIconImageView setContentCompressionResistancePriority:compressionPriority forAxis:UILayoutConstraintAxisHorizontal];
        [_customIconImageView setContentHuggingPriority:huggingPriority forAxis:UILayoutConstraintAxisHorizontal];
        [_customIconImageView setContentCompressionResistancePriority:compressionPriority forAxis:UILayoutConstraintAxisVertical];
        [_customIconImageView setContentHuggingPriority:huggingPriority forAxis:UILayoutConstraintAxisVertical];

        _customIconImageView.status = SFCustomStatus_Normal;
    }
    return _customIconImageView;
}
@end
