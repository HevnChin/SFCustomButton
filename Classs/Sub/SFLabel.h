//
//  AILabel.h
//  UpLive
//
//  Created by LUCA on 2020/01/15.
//  Copyright © 2020 AsiaInnovations. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SFCustomButtonHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface SFLabel : UILabel
///默认
@property (nonatomic, copy) NSString *normalText;
@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIFont *normalTextFont;

//高亮
@property (nonatomic, copy) NSString *highlightedText;
//@property (nonatomic, strong) UIColor *highlightedTextColor;
@property (nonatomic, strong) UIFont *highlightedTextFont;

///选中
@property (nullable, nonatomic, copy) NSString *selectedText;
@property (nullable, nonatomic, strong) UIColor *selectedTextColor;
@property (nullable, nonatomic, strong) UIFont *selectedTextFont;

///不可用
@property (nullable, nonatomic, copy) NSString *disabledText;
@property (nullable, nonatomic, strong) UIColor *disabledColor;
@property (nullable, nonatomic, strong) UIFont *disabledTextFont;

@property (nonatomic, assign) SFCustomStatus status;
///当前标题
@property(nullable, nonatomic,readonly) NSString  *currentTitle;
///当前标题色
@property(nullable, nonatomic,readonly) UIColor  *currentTitleColor;
@end

NS_ASSUME_NONNULL_END
