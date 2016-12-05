//
//  ZYHeaderOptionViewLabel.h
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/1.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYHeaderOptionViewLabel : UILabel

/** 填充色,从左开始*/
@property (nonatomic,strong) UIColor *fillColor;
/**滑动进度*/
@property (nonatomic,assign) CGFloat progress;


@end
