//
//  ViewController.m
//  SFCustomButton
//
//  Created by LUCA on 2020/01/17.
//  Copyright © 2020 LUCA. All rights reserved.
//

#import "ViewController.h"
#import "SFCustomButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SFCustomButton *lrIconTextButton;
@property (weak, nonatomic) IBOutlet SFCustomButton *lrTextIconButton;
@property (weak, nonatomic) IBOutlet SFCustomButton *tbIconTextButton;
@property (weak, nonatomic) IBOutlet SFCustomButton *tbTextIconButton;
@property (weak, nonatomic) IBOutlet SFCustomButton *textButton;
@property (weak, nonatomic) IBOutlet SFCustomButton *IconButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    
    [self configLeftRight];
    [self configTopBottom];
    [self configSample];
}

#pragma mark -
#pragma mark -Inner
- (void)configLeftRight {
    SFCustomButton *button = self.lrIconTextButton;
    button.type = SFCustomButtonType_LeadingTrailing_IconText;
    button.iconTextSpacing = 2;
    [button setTitle:@"私密" forState:UIControlStateNormal];
    [button setTitleFont:[UIFont systemFontOfSize:15 weight:(UIFontWeightMedium)] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.6] forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"simi_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"simi_icon_s"] forState:UIControlStateSelected];
    
    button.titleLabel.layer.shadowColor = [UIColor colorWithWhite:0 alpha:1].CGColor;
    button.titleLabel.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    button.titleLabel.layer.shadowOpacity = 0.3;
    button.titleLabel.layer.shadowRadius = 2;
    
    
    button = self.lrTextIconButton;
    button.type = SFCustomButtonType_LeadingTrailing_TextIcon;
    button.iconTextSpacing = 2;
    [button setTitle:@"门票" forState:UIControlStateNormal];
    [button setTitleFont:[UIFont systemFontOfSize:15 weight:(UIFontWeightMedium)] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.6] forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"menpiao_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"menpiao_icon_s"] forState:UIControlStateSelected];
    
    button.titleLabel.layer.shadowColor = [UIColor colorWithWhite:0 alpha:1].CGColor;
    button.titleLabel.layer.shadowOffset = CGSizeMake(0.5, 0.5);
    button.titleLabel.layer.shadowOpacity = 0.3;
    button.titleLabel.layer.shadowRadius = 2;
}

- (void)configTopBottom {
    SFCustomButton *button = self.tbIconTextButton;
    button.type = SFCustomButtonType_TopBottom_IconText;
    button.iconTextSpacing = 2;
    
    button.titleLabel.numberOfLines = 2;
    button.titleLabel.layer.shadowRadius = 2;
    
    [button setTitle:@"视频直播" forState:UIControlStateNormal];
    [button setTitleFont:[UIFont systemFontOfSize:10 weight:(UIFontWeightMedium)] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.6] forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"live_icon_video"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"live_icon_video_s"] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"live_icon_video_s"] forState:UIControlStateHighlighted];

    
    button = self.tbTextIconButton;
    button.type = SFCustomButtonType_TopBottom_TextIcon;
    button.iconTextSpacing = 3;
    
    button.titleLabel.numberOfLines = 2;
    button.titleLabel.layer.shadowRadius = 2;

    [button setTitle:@"声音直播" forState:UIControlStateNormal];
    [button setTitleFont:[UIFont systemFontOfSize:10 weight:(UIFontWeightMedium)] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.6] forState:UIControlStateNormal];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
    [button setTitleColor:UIColor.whiteColor forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:@"live_icon_sound"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"live_icon_sound_s"] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"live_icon_sound_s"] forState:UIControlStateHighlighted];
}

- (void)configSample {
}
@end
