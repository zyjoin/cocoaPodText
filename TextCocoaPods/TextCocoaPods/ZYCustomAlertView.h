//
//  ZYCustomAlertView.h
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/2.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYCustomAlertView : UIView

/**
 自定义取消按钮点击事件

 @param cancelBlock  canceBlock 可选
 */
- (void)setUpCancelBlock:(BOOL (^)())cancelBlock;

/**
 自定义确定或者自定义按钮确定点击事件

 @param touchBlock  touchUPBlock 必选
 */
- (void)SetUpSureBlock:(BOOL (^)())touchBlock;

/**
 传 nil 默认为 app window

 @param window  当前控件
 */
- (void)showInView:(UIView *)window;

/**
 *  构造方法
 *
 *  @param title  内容
 *  @param cancel 取消 左边
 *  @param sure   确定 右边
 */
- (instancetype)initWithTitle:(NSString *)title cancel:(NSString *)cancel sure:(NSString *)sure;

@end
