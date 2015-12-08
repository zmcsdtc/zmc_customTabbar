//
//  CustomTabbar.h
//  tarbar-选中状态-背景色
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleImageButton.h"
typedef enum{
    /**
     *  正常情况
     */
    CustomTabbarStyleNormal,
    /**
     *  点击整个变色
     */
    CustomTabbarStyleSelectedStatus,
}CustomTabbarStyle;
@protocol CustomTabbarDelegate <NSObject>
- (void) clickThisBtnAtIndex:(NSInteger)index;
@end

@interface CustomTabbar : UIView
{
    TitleImageButton*_lastBtn;
}
/**
 *  初始化自定义的tabbar
 *
 *  @param titles         标题数组
 *  @param images         普通状态图片的数组
 *  @param selectedImgaes 选中状态图片的数组
 *  @param tabBarStyle    tabBar的风格
 *  @param bgColor        view的背景色
 *  @param selectedColor  当类型是CustomTabbarStyleSelectedStatus,选中时候的背景色
 */
-(instancetype)initWithTitles:(NSArray*)titles images:(NSArray*)images selectedImages:(NSArray*)selectedImgaes tabBarStyle:(CustomTabbarStyle)tabBarStyle norTextColor:(UIColor*)norTextColor selectedTextColor:(UIColor*)selectedTextColor bgColor:(UIColor*)bgColor selectedColor:(UIColor*)selectedColor;
/**
 *  tabbar的风格
 */
@property(assign,nonatomic)CustomTabbarStyle tabbarStyle;
@property(weak,nonatomic)id<CustomTabbarDelegate>tabbarDelegate;
/**
 *  背景色
 */
@property(strong,nonatomic)UIColor*bgColor;
/**
 *  CustomTabbarStyleSelectedStatus-选中的button的颜色
 */
@property(strong,nonatomic)UIColor*selectedColor;
/**
 *  字体大小
 */
@property(strong,nonatomic)UIFont* tabBarFont;
@end
