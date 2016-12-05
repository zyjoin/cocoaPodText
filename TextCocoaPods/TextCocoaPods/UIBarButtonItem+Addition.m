

#import "UIBarButtonItem+Addition.h"
#import <objc/runtime.h>

static char btnBlockKey;
static char itemBlockKey;
typedef void (^ActionBlock)();

@implementation UIBarButtonItem (Addition)

static char itemBlockKey;
//给定 图片创建UIBarbutton
+ (instancetype)itemWithImagename:(NSString *)imagename hightImagename:(NSString *)hightImagename target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imagename) {
        [button setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
        
    }
    if (hightImagename) {
        [button setImage:[UIImage imageNamed:hightImagename] forState:UIControlStateHighlighted];
    }
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.frame = (CGRect){CGPointZero,button.currentImage.size};
    
    return [[self alloc] initWithCustomView:button];
    
}

+ (instancetype)itemWithImagename:(NSString *)imagename hightImagename:(NSString *)hightImagename touchBlock:(void (^)())block {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imagename) {
        [button setImage:[UIImage imageNamed:imagename] forState:UIControlStateNormal];
    }
    if (hightImagename) {
        [button setImage:[UIImage imageNamed:hightImagename] forState:UIControlStateHighlighted];
    }
    [button addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject(button, &btnBlockKey, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    button.frame = (CGRect){CGPointZero, button.currentImage.size};
    [item setCustomView:button];
    return item;
}
//给定标题和颜色
+ (instancetype)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action tintColor:(UIColor *)tintColor {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:target
                                                            action:action];
    item.tintColor = tintColor;
    return item;
    
}
+ (instancetype)itemWithTitle:(NSString *)title tintColor:(UIColor *)tintColor touchBlock:(void (^)())block {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(itemTouch:)];
    item.tintColor = tintColor;
    item.block = block;
    return item;
}
+ (void)itemTouch:(UIBarButtonItem *)item {
    
    if (item.block) {
        item.block();
    }
}
- (void)setBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &itemBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (ActionBlock)block {
    return objc_getAssociatedObject(self, &itemBlockKey);
}
#pragma mark - 实现点击效果
- (void)btnTouch:(UIButton *)button {
    ActionBlock blcok= objc_getAssociatedObject(button, &btnBlockKey);
    if (blcok) {
        blcok();
    }
}

@end
