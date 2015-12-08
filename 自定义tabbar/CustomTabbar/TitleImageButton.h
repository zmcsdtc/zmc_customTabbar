//
//  TitleImageButton.h
//  Kitchener_User
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    /**
     *  图片和文字上下分布,文字在上
     */
    TitleImageButtonDistributeStyleTopAndBottom,
    /**
     *  图片和文字上下分布,图片在上
     */
    TitleImageButtonDistributeStyleImageTopAndBottom,
    
    /**
     *  图片和文字左右分布
     */
    TitleImageButtonDistributeStyleRightAndLeft,
    
    TitleImageButtonDistributeStyleTextRightAndLeft
    
}TitleImageButtonDistributeStyle;

@interface TitleImageButton : UIButton
/**
 *  图片占比例
 */
@property(assign,nonatomic)CGFloat imageRatio;
@property(assign,nonatomic)TitleImageButtonDistributeStyle style;
/**
 *  图片布局位置
 */
@property(assign,nonatomic)UIViewContentMode imageMode;
/**
 *  文字布局位置
 */
@property(assign,nonatomic)NSTextAlignment textAlignment;
/**
 *  字体大小
 */
@property(assign,nonatomic)UIFont* textFont;

/**
 *  更新新的按钮宽度
 */
-(void)upDateWidth;
+(TitleImageButton*)createBtnFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName selecetdImage:(NSString*)selecetdImage titleColor:(UIColor*)color target:(id)target action:(SEL)action style:(TitleImageButtonDistributeStyle)style tag:(NSInteger)tag;
@end
