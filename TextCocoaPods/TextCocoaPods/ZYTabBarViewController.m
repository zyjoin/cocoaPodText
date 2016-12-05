//
//  ZYTabBarViewController.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/11/29.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "ZYTabBarViewController.h"
#import "NavViewController.h"
#import "FirstViewController.h"
#import "ZYNavigationController.h"

#import "SecondViewController.h"
//#import "NHServiceListRequest.h"
//#import "NHServiceListModel.h"/

@interface ZYTabBarViewController ()

@end

@implementation ZYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 添加子控制器
    [self addChildViewControllerWithClassName:[FirstViewController description] imageName:nil title:@"你好"];
    // 添加子控制器
    [self addChildViewControllerWithClassName:[SecondViewController
                                               description] imageName:nil title:@"你好"];
  
    
}

#pragma mark - 添加子控制器
- (void)addChildViewControllerWithClassName:(NSString *)vcName imageName:(NSString *)imageNaem title:(NSString *)titleName {
    UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
    
    ZYNavigationController *navC = [[ZYNavigationController alloc] initWithRootViewController:vc];
    navC.tabBarItem.title = titleName;
    navC.tabBarItem.image = [UIImage imageNamed:imageNaem];
    navC.tabBarItem.selectedImage = [[UIImage imageNamed:[imageNaem stringByAppendingString:@"_press"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:navC];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
