//
//  HMTabBarController.m
//  WeiBo
//
//  Created by 李云祥 on 16/8/4.
//  Copyright © 2016年 李云祥. All rights reserved.
//

#import "HMTabBarController.h"

@interface HMTabBarController ()

@end

@implementation HMTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpAllChildViewController];
    
    
    
}
-(void)setUpAllChildViewController
{
    UIViewController *home = [[UIViewController alloc]init];
    [self setUpChildViewController:home title:@"首页" imageName:@"tabbar_home" selImageName:@"tabbar_home_selected"];
    
    UIViewController *message = [[UIViewController alloc]init];
    [self setUpChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selImageName:@"tabbar_message_center_selected"];
    
    UIViewController *discover = [[UIViewController alloc]init];
    [self setUpChildViewController:discover title:@"发现" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
    
    
    UIViewController *profile = [[UIViewController alloc]init];
    [self setUpChildViewController:profile title:@"我" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
}

-(void)setUpChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    vc.title = title;
    
    
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary *att = [NSMutableDictionary dictionary];
    att[NSForegroundColorAttributeName] = [UIColor orangeColor];
//    [att setObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
    vc.tabBarItem.selectedImage = selImage;
    [self addChildViewController:vc];
}


@end
