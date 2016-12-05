
#import "ZYCustomSegumentView.h"
#import "UIView+ZYLayer.h"

@implementation ZYCustomSegumentView
{
    NSArray *_itemTitles;
    UIButton *_selectedBtn;
    
}
//实行segument 方法
- (instancetype)initWithItemTitlesArray:(NSArray *)titleArray {
    if (self = [super init]) {
        NSLog(@"121243214312");
        
        
        _itemTitles = titleArray;
        //给自定义 segument 赋值
        self.layerCornerRadius = 3.00f;
        self.layerBorderColor = [UIColor redColor];
        self.layerBorderWidth = 1.00f;
        //设置子控件
        [self setUpChildViews];
        
    }
    return self;
}

- (void)clickDefault {
    
    if (_itemTitles.count == 0) {
        return;
    }
    else {
        [self btnClickSegumen:(UIButton *)[self viewWithTag:1]];

    }
}
#pragma mark - 设置子控件
- (void)setUpChildViews {
    if (_itemTitles.count > 0) {
        NSInteger i = 0;
        for (id obj in _itemTitles) {
            if ([obj isKindOfClass:[NSString class]]) {
                NSString *objStr = (NSString *)obj;
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                [self addSubview:btn];
                btn.backgroundColor = [UIColor clearColor];
                [btn setTitle:objStr forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                btn.titleLabel.font = [UIFont systemFontOfSize:20];
                i = i + 1;
                btn.tag = i;
                [btn addTarget:self action:@selector(btnClickSegumen:) forControlEvents:UIControlEventTouchUpInside];
                //默认情况下，在按钮被禁用时，图像会被画的颜色深一些。要禁用此功能，可以将这个属性设置为NO
                
                btn.adjustsImageWhenDisabled = NO;
                //默认情况下，按钮在被禁用时，图像会被画的颜色淡一些。要禁用此功能，可以将这个属性设置为NO
                btn.adjustsImageWhenHighlighted = NO;
                
            }
        }
    }
}
- (void)btnClickSegumen:(UIButton *)btn {
    _selectedBtn.backgroundColor = [UIColor greenColor];
    btn.backgroundColor = [UIColor brownColor];
    
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    NSString *title = btn.currentTitle;
    if (self.ZYCustomSegmentBtnClickHandle) {
        self.ZYCustomSegmentBtnClickHandle(self,title,btn.tag - 1);
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"sdadfdsv");

    if (_itemTitles.count > 0) {
        
        CGFloat btnW = self.frame.size.width / _itemTitles.count;
        for (int i = 0; i < _itemTitles.count; i++) {
            UIButton *btn = (UIButton *)[self viewWithTag:i + 1];
            btn.frame = CGRectMake(btnW * i, 0, btnW, self.frame.size.height);
        }
    }
    
}
@end
