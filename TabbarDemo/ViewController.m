//
//  ViewController.m
//  TabbarDemo
//
//  Created by Ge on 15/8/22.
//  Copyright (c) 2015 Ge. All rights reserved.
//

#import "ViewController.h"
#import "SCNavTabBarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIViewController *threeViewController = [[UIViewController alloc] init];
    threeViewController.title = @"娱乐八卦";
    threeViewController.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController *fourViewController = [[UIViewController alloc] init];
    fourViewController.title = @"天府之国";
    fourViewController.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController *sevenViewController = [[UIViewController alloc] init];
    sevenViewController.title = @"国际新闻";
    sevenViewController.view.backgroundColor = [UIColor blueColor];
    
    UIViewController *nViewController = [[UIViewController alloc] init];
    nViewController.title = @"啊啊啊闻";
    nViewController.view.backgroundColor = [UIColor yellowColor];
    
    SCNavTabBarController *navTabBarController = [[SCNavTabBarController alloc] init];
    navTabBarController.subViewControllers = @[threeViewController, fourViewController,sevenViewController,nViewController];
    navTabBarController.titlesColor = [UIColor blueColor];
    navTabBarController.mainViewBounces = YES;
    [navTabBarController addParentController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
