//
//  BaseViewController.h
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/1.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)removeChildVc:(UIViewController *)childVc;

- (void)addChildVc:(UIViewController *)childVc;

@end
