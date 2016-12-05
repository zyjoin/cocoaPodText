

//
//  ZYCustomAlertView.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/2.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "ZYCustomAlertView.h"
#import "FXBlurView.h"//毛玻璃框架

@interface ZYCustomAlertView ()

/** 创建毛玻璃框架的属性*/
@property (nonatomic,strong) FXBlurView *blurview;
/**创建标题*/
@property (nonatomic,copy)  NSString    *title;
/**创建取消文字*/
@property (nonatomic,copy) NSString    *cancelStr;
/**创建确定文字*/
@property (nonatomic,copy) NSString    *sureStr;






@end
@implementation ZYCustomAlertView
- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"阿萨德");

    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title cancel:(NSString *)cancel sure:(NSString *)sure {
    if (self = [super init]) {
        NSLog(@"不知道咋回事");
        _title = title;
        _cancelStr = cancel;
        _sureStr = sure;
        //设置
        
    }
    return self;
}


- (void)setUp {
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4f];
    CGFloat kScreenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat kScreenH = [UIScreen mainScreen].bounds.size.height;
    _blurview = [[FXBlurView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    
    _blurview.tintColor = [UIColor clearColor];
    
    
    
    
    
    
    
}
@end
