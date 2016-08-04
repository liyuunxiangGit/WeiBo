//
//  HMTabBar.m
//  WeiBo
//
//  Created by 李云祥 on 16/8/4.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "HMTabBar.h"
@interface HMTabBar()

@property (nonatomic,weak)UIButton *plusButton;

@end
@implementation HMTabBar

-(UIButton *)plusButton
{
    if (_plusButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add" ] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted"]forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"]forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        //默认按钮尺寸跟背景图片一样大
        //sizeToFit :默认会根据按钮的背景图片或者image和文字计算出按钮最合适的尺寸。
        [btn sizeToFit];
        _plusButton = btn;
        [self addSubview:btn];
    }
    return _plusButton;
}
-(void)layoutSubviews{
    [super layoutSubviews];
//    [self setUpAllTabBarButtonFrame];
    //调整系统自带的tabBar的按钮位置

    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.bounds.size.width / (self.items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    
    int i = 0 ;
    for (UIView *tabBarButton in self.subviews) {
        //tabBarButton  这是一个私有api  所以得用反射机制进行  根据字符串反射出一个类名
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            btnX = i * btnW;
            tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);
            i++;
        }
    }
    self.plusButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height* 0.5);
    self.plusButton.bounds = CGRectMake(0, 0, self.plusButton.currentImage.size.width, self.plusButton.currentImage.size.height);
    
}

@end
