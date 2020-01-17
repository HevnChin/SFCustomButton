//
//  AICustomButton.h
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFImageView.h"
#import "SFLabel.h"

///leading.trailing.top.bottom
typedef NS_ENUM(NSInteger,SFCustomButtonType){
    ///居中: 左Icon右Text
    SFCustomButtonType_LeadingTrailing_IconText = 0,
    ///居中: 左Text右Icon
    SFCustomButtonType_LeadingTrailing_TextIcon = 1,
    //上下结构
    ///居中: 上Icon下Text
    SFCustomButtonType_TopBottom_IconText = 2,
    ///居中: 上Text下Icon
    SFCustomButtonType_TopBottom_TextIcon = 3,
    ///imageOnly
    SFCustomButtonType_Icon = 4,
    ///TextOnly
    SFCustomButtonType_Text = 5,
};



NS_ASSUME_NONNULL_BEGIN
@interface SFCustomButton : UIButton
/// default is AICustomButtonType_LeadingTrailing_IconText
+ (instancetype)buttonWithCustomType:(SFCustomButtonType)buttonType;

///default = 5
@property (nonatomic, assign) CGFloat iconTextSpacing;
///normal/selected/disabled
@property (nonatomic, assign) SFCustomStatus status;

///类型
@property (nonatomic, assign) SFCustomButtonType type;

///放大热区范围
- (void)zoomHotSpotsToSize:(CGSize)size;

/// default is nil. font is assumed to be font 15,normal/selected/disabled support
- (void)setTitleFont:(nullable UIFont *)font forState:(UIControlState)state;
/// default is nil.normal/selected/disabled support
- (void)setImageResetColor:(UIColor *)color forState:(UIControlState)state;
@end

NS_ASSUME_NONNULL_END
