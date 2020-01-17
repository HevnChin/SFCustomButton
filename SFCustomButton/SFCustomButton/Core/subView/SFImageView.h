//
//  AIImageView.h
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFCustomButtonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFImageView : UIImageView
///普通图片
@property (nullable, nonatomic, strong) UIImage *normalImage;
///选中图片
@property (nullable, nonatomic, strong) UIImage *selectedImage;
///不可用图片
@property (nullable, nonatomic, strong) UIImage *disabledImage;
///高亮
//@property (nullable, nonatomic, strong) UIImage *highlightedImage;
///可用状态
- (void)setEnabled:(BOOL)enabled;

///原先组件使用的属性
///附加图片的颜色处理:正常
@property (nullable, nonatomic, strong) UIColor *imageNormalColor;
///附加图片的颜色处理:选中
@property (nullable, nonatomic, strong) UIColor *imageSelectedColor;
///附加图片的颜色处理:不可用
@property (nullable, nonatomic, strong) UIColor *imageDisabledColor;

///当前状态
@property (nonatomic, assign) SFCustomStatus status;

/// normal/highlighted/selected/disabled. can return nil
@property(nullable, nonatomic,readonly) UIImage  *currentImage;
@end

NS_ASSUME_NONNULL_END
