//
//  ViewController.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/9.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backGround = [UIImage imageNamed:@"begin_1.jpg"];
    self.view.layer.contents = (id) backGround.CGImage;    // 如果需要背景透明加上下面这句
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //延迟2s调用，一般启动页面会停留，或者有些动画什么的，本例只简述思路，不深究细节
    [self performSelector:@selector(changeView) withObject:self afterDelay:1];
    
}

- (void)changeView {
    DBIOtherPageViewController *firstViewController = [[DBIOtherPageViewController alloc]init];
    firstViewController.tabBarItem.title = @"首页";
    firstViewController.tabBarItem.image = [[UIImage imageNamed:@"shouye"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    firstViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DBIHomeViewController *homeViewController = [[DBIHomeViewController alloc]init];
    homeViewController.tabBarItem.title = @"书影音";
    homeViewController.tabBarItem.image = [[UIImage imageNamed:@"book"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"book_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DBIOtherPageViewController *thirdViewController = [[DBIOtherPageViewController alloc]init];
    thirdViewController.tabBarItem.title = @"小组";
    thirdViewController.tabBarItem.image = [[UIImage imageNamed:@"group"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"group_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DBIOtherPageViewController *fourViewController = [[DBIOtherPageViewController alloc]init];
    fourViewController.tabBarItem.title = @"市集";
    fourViewController.tabBarItem.image = [[UIImage imageNamed:@"store"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fourViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"store_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DBIOtherPageViewController *fiveViewController = [[DBIOtherPageViewController alloc]init];
    fiveViewController.tabBarItem.title = @"我的";
    fiveViewController.tabBarItem.image = [[UIImage imageNamed:@"my"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fiveViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"my_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *arrayNav = [NSArray arrayWithObjects:firstViewController, homeViewController, thirdViewController, fourViewController, fiveViewController, nil];
    
    UITabBarController *TBC = [[UITabBarController alloc]init];
    TBC.viewControllers = arrayNav;
    self.view.window.rootViewController = TBC ;
    TBC.tabBar.tintColor = [UIColor greenColor];
}


@end
