//滚动选择试图
#import <UIKit/UIKit.h>

@interface ZYScrollViewOptionalView : UIView
/** 标题数组*/
@property (nonatomic,strong)  NSArray <NSString *>*titles;

/**点击 item 回调*/
@property (nonatomic,copy) void (^scrollviewOptionViewItemClickHandle)(ZYScrollViewOptionalView *optionView , NSString *title,NSInteger currentView);

/**偏移量*/
@property (nonatomic,assign) CGPoint contentOffset;


@end
