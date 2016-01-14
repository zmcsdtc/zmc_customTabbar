//
//  CustomTabbar.m
//  tarbar-选中状态-背景色
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import "CustomTabbar.h"
#define kSelfWidth self.frame.size.width
#define kSelfHeight self.frame.size.height
#define kWindowWidth [UIScreen mainScreen].bounds.size.width
#define kWindowHeigth [UIScreen mainScreen].bounds.size.height
#define kNaviGationBarHeight 64
#define kTabBarHeight 49
#define angle2Radian(angle) ((angle) / 180.0 * M_PI)
@implementation CustomTabbar
-(instancetype)initWithTitles:(NSArray*)titles images:(NSArray*)images selectedImages:(NSArray*)selectedImgaes tabBarStyle:(CustomTabbarStyle)tabBarStyle norTextColor:(UIColor*)norTextColor selectedTextColor:(UIColor*)selectedTextColor bgColor:(UIColor*)bgColor selectedColor:(UIColor*)selectedColor;{
    if (self=[super init]) {
        self.frame=CGRectMake(0, kWindowHeigth-kTabBarHeight, kWindowWidth, kTabBarHeight);
        //设置默认背景色和默认类型
        if (bgColor) {
            self.backgroundColor=bgColor;
            self.bgColor=bgColor;
        }
        else{
            self.backgroundColor=[UIColor whiteColor];
        }
        if (tabBarStyle) {
            self.tabbarStyle=tabBarStyle;
        }
        else{
            self.tabbarStyle=CustomTabbarStyleNormal;
        }
        if (selectedColor) {
            self.selectedColor=selectedColor;
        }
        
        [self setupAllBarItemsWithTitles:titles images:images selectedImages:selectedImgaes norTextColor:norTextColor selectedTextColor:selectedTextColor];
    }
    return self;
}
- (void)setupAllBarItemsWithTitles:(NSArray*)titles images:(NSArray*)image selectedImages:(NSArray*)selectedImages norTextColor:(UIColor*)norTextColor selectedTextColor:(UIColor*)selectedTextColor{
    CGFloat width=kSelfWidth/titles.count;
    for (NSInteger i=0; i<titles.count; i++) {
        TitleImageButton*btn=[TitleImageButton createBtnFrame:CGRectMake(i*width, 0, width, kSelfHeight) title:titles[i] imageName:image[i] selecetdImage:selectedImages[i] titleColor:[UIColor redColor] target:self action:@selector(clickThisBtn:) style:TitleImageButtonDistributeStyleImageTopAndBottom tag:i];
        btn.textAlignment=NSTextAlignmentCenter;
        btn.imageMode=UIViewContentModeTop;
        btn.imageRatio=0.6;
        [btn setTitleColor:norTextColor forState:0];
        [btn setTitleColor:selectedTextColor forState:UIControlStateSelected];
        if (i==0) {
            btn.selected=YES;
            _lastBtn=btn;
            if (self.tabbarStyle==CustomTabbarStyleSelectedStatus) {
                _lastBtn.backgroundColor=_selectedColor;
            }
        }
        
        [self addSubview:btn];
    }
}
- (void)clickThisBtn:(TitleImageButton*)btn{
    if ([self.tabbarDelegate respondsToSelector:@selector(clickThisBtnAtIndex:)]) {
        [self.tabbarDelegate clickThisBtnAtIndex:btn.tag];
    }
    if (btn!=_lastBtn) {
        if (self.tabbarStyle==CustomTabbarStyleSelectedStatus) {
            _lastBtn.backgroundColor=_bgColor;
            btn.backgroundColor=_selectedColor;
        }
        btn.selected=YES;
        _lastBtn.selected=NO;
        _lastBtn=btn;
        [self addCAkeyAnimation];
    }
}

//设置背景色
- (void) setBgColor:(UIColor *)bgColor{
    self.backgroundColor=bgColor;
}
//设置字体大小
- (void) setTabBarFont:(UIFont *)tabBarFont{
    for (TitleImageButton*btn in [self subviews]) {
        btn.titleLabel.font=tabBarFont;
    }
}
#pragma mark-点击tabbar抖动动画
- (void) addCAkeyAnimation{
    CAKeyframeAnimation  *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"transform.rotation";
    // 度数 / 180 * M_PI
    keyAnima.values = @[@(-angle2Radian(4)),@(angle2Radian(0)),@(angle2Radian(4)),@(angle2Radian(0))];
    keyAnima.removedOnCompletion = NO;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.2;
    
    // 设置动画重复的次数
    keyAnima.repeatCount = 0;
    // 2.添加核心动画
    [_lastBtn.layer addAnimation:keyAnima forKey:nil];

}
@end
