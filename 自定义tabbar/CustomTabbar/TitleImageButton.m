//
//  TitleImageButton.m
//  Kitchener_User
//
//  Created by ZMC on 15/12/6.
//  Copyright © 2015年 Zmc. All rights reserved.
//

#import "TitleImageButton.h"

@implementation TitleImageButton

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        // 1.设置文字的显示格式
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont boldSystemFontOfSize:10];
        
        
        // 2.设置imageView的显示格式
        self.imageView.contentMode = UIViewContentModeLeft;
        
        
        // 3.默认是左右显示模式
        self.style = TitleImageButtonDistributeStyleRightAndLeft;
        
        // 4.设置默认比例
        self.imageRatio = 0.5;
        
    }
    return self;
}
//图片对齐格式
- (void) setImageMode:(UIViewContentMode)imageMode{
    self.imageView.contentMode=imageMode;
}
//文字对齐格式
- (void) setTextAlignment:(NSTextAlignment)textAlignment{
    self.titleLabel.textAlignment=textAlignment;
}

- (void)setHighlighted:(BOOL)highlighted
{
    
}
- (void)setTextFontt:(UIFont *)textFont{
    self.titleLabel.font=textFont;
}
#pragma mark 重写titleRectForContentRect方法，内部调整imageView的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    
    if(self.style == TitleImageButtonDistributeStyleTopAndBottom)
    {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat H = self.frame.size.height;
        CGFloat W = self.frame.size.width;
        
        return CGRectMake(x, y, W, H);
    }
    else if (self.style==TitleImageButtonDistributeStyleImageTopAndBottom){
        CGFloat x = 0;
        CGFloat y = self.frame.size.height *(1-self.imageRatio);
        CGFloat W = self.frame.size.width;
        CGFloat H = self.frame.size.height * self.imageRatio;
        return CGRectMake(x, y, W, H);
    }
    else if (self.style==TitleImageButtonDistributeStyleTextRightAndLeft){
        CGFloat x = self.frame.size.width*self.imageRatio;;
        CGFloat y = 0;
        CGFloat W = self.frame.size.width*(1-self.imageRatio);
        CGFloat H = self.frame.size.height;
        return CGRectMake(x, y, W, H);
    }
    else
    {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat H = self.frame.size.height;
        CGFloat W = self.frame.size.width*(1-self.imageRatio);
        return CGRectMake(x, y, W, H);
    }
}

#pragma mark 重写 imageRectForContentRect方法，内部调整文字的位置
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if(self.style == TitleImageButtonDistributeStyleTopAndBottom)
    {
        CGFloat x = 0;
        CGFloat y = self.frame.size.height *(1-self.imageRatio);
        CGFloat W = self.frame.size.width;
        CGFloat H = self.frame.size.height * self.imageRatio;
        return CGRectMake(x, y, W, H);
    }
    else if (self.style==TitleImageButtonDistributeStyleImageTopAndBottom){
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat H = self.frame.size.height;
        CGFloat W = self.frame.size.width;
        return CGRectMake(x, y, W, H);
    }
    else if (self.style==TitleImageButtonDistributeStyleRightAndLeft){
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat H = self.frame.size.height;
        CGFloat W = self.frame.size.width*self.imageRatio;
        return CGRectMake(x, y, W, H);
    }
    else
    {
        CGFloat x = self.frame.size.width*(1-self.imageRatio);
        CGFloat y = 0;
        CGFloat W = self.frame.size.width*self.imageRatio;
        CGFloat H = self.frame.size.height;
        return CGRectMake(x, y, W, H);
    }
    
}
/**
 *  要把NSSting+common加进来
 */
-(void)upDateWidth{
//    CGFloat width=[NSString widthByString:self.titleLabel.text font:self.titleLabel.font height:self.height];
//    self.width=width/(1-_imageRatio);
}
+(TitleImageButton*)createBtnFrame:(CGRect)frame title:(NSString *)title imageName:(NSString *)imageName selecetdImage:(NSString*)selecetdImage titleColor:(UIColor*)color target:(id)target action:(SEL)action style:(TitleImageButtonDistributeStyle)style tag:(NSInteger)tag{
    TitleImageButton*btn=[TitleImageButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (title) {
        [btn setTitle:title forState:0];
        [btn setTitleColor:color forState:0];
    }
    if (imageName) {
        [btn setImage:[UIImage imageNamed:imageName] forState:0];
    }
    if (selecetdImage) {
        [btn setImage:[UIImage imageNamed:selecetdImage] forState:UIControlStateSelected];
    }
    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    if (style) {
        btn.style=style;
    }
    if (tag) {
        btn.tag=tag;
    }
    return btn;

}

@end
