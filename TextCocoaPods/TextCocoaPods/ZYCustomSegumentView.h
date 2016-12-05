//  切换视图，类似于系统的UISegmentControl


#import <UIKit/UIKit.h>

@interface ZYCustomSegumentView : UIView
//设置 segument 的数组,有几个按钮 方法
- (instancetype)initWithItemTitlesArray:(NSArray *)titleArray;

/**创建 block 属性 从0开始点击*/
@property (nonatomic,copy) void (^ZYCustomSegmentBtnClickHandle)(ZYCustomSegumentView *zyCustomSegument,NSString *currentTitle,NSInteger currentIntrger);

- (void)clickDefault;

@end
