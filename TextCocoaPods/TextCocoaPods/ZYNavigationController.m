
//
//  ZYNavigationController.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/2.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "ZYNavigationController.h"
#import "UIBarButtonItem+Addition.h"

@interface ZYNavigationController ()

@end

@implementation ZYNavigationController
//初始化一次
+ (void)initialize {
    //导航栏设置为不透明
    [[UINavigationBar appearance] setTranslucent:NO];
    //设置导航栏背景颜色
    [UINavigationBar appearance].barTintColor = [UIColor grayColor];
    //设置导航栏标题文字颜色
    NSMutableDictionary *titleColor = [NSMutableDictionary dictionary];
    //1文字打字
    titleColor[NSFontAttributeName] = [UIFont systemFontOfSize:12.0];
    //2文字颜色
    titleColor[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [[UINavigationBar appearance] setTitleTextAttributes:titleColor];
    
    //拿到整个导航控制器的外观
    //设置的是返回按钮
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    item.tintColor = [UIColor blackColor];
    
    NSMutableDictionary *atts = [NSMutableDictionary dictionary];
    atts[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    atts[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [item setTitleTextAttributes:atts forState:UIControlStateNormal];
    
    //导航栏
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}
//当 push 进控制器时候就需要调用
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        if (self.viewControllers.count == 1) {//当控制器 push 一个
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            [btn setImage:[UIImage imageNamed:@"back_neihan"] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
            btn.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem = leftItem;
        }else if (self.viewControllers.count > 1) {//当 push 两个以上,直接返回到跟控制器
             UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 44)];
            [btn setImage:[UIImage imageNamed:@"back_neihan"] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
            btn.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
            UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
            
            [btn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem = leftItem;
            
            
            UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(btn.frame), 0, 44, 44)];

            [btn1 setImage:[UIImage imageNamed:@"back_neihan"] forState:UIControlStateNormal];
            btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            btn1.tintColor = [UIColor colorWithRed:0.42f green:0.33f blue:0.27f alpha:1.00f];
            UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
            
            [btn1 addTarget:self action:@selector(backRootPop) forControlEvents:UIControlEventTouchUpInside];
//            viewController.navigationItem.leftBarButtonItem = leftItem1;
            
            viewController.navigationItem.leftBarButtonItems = @[leftItem,leftItem1];
          

        }
        else {
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"巴拉巴拉拉" tintColor:[UIColor redColor] touchBlock:^{
                [self popViewControllerAnimated:YES];
            }];
            
        }
    }
    [super pushViewController:viewController animated:animated];
    
}
- (void)backRootPop {
   
    [self popToRootViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
