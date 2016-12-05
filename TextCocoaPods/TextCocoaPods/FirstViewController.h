//
//  FirstViewController.h
//  TextCocoaPods
//
//  Created by QingZhi on 2016/11/29.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NHServiceListModel;

@interface FirstViewController : UIViewController
@property (nonatomic, strong) NSArray <NHServiceListModel *>*models;

@end
