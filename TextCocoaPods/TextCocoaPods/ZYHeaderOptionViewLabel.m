
//
//  ZYHeaderOptionViewLabel.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/1.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "ZYHeaderOptionViewLabel.h"

@implementation ZYHeaderOptionViewLabel
//设置进度
- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    
    [self setNeedsDisplay];
    
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [_fillColor set];
    CGRect newRect = rect;
    newRect.size.width = rect.size.width * self.progress;
    //随着 process 字体逐渐变色
    UIRectFillUsingBlendMode(newRect, kCGBlendModeSourceIn);
    
}

@end
