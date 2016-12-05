
//view 图层属性
#import <UIKit/UIKit.h>

@interface UIView (ZYLayer)
/**
 设置 view 的边角半径 边角宽度和颜色

 @param cornerRadius 半径
 @param borderWidth 颜色
 @param borderColor 边角颜色
 */
- (void)setLayerCornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**边角半径*/
@property (nonatomic,assign) CGFloat layerCornerRadius;
/**边角宽度*/
@property (nonatomic,assign) CGFloat layerBorderWidth;
/** 边线颜色*/
@property (nonatomic,strong) UIColor *layerBorderColor;




@end
