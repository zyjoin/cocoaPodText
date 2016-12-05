
//scrllview滚动

#import "ZYScrollViewOptionalView.h"
#import "ZYDefaultHeader.h"
#import "ZYHeaderOptionViewLabel.h"

@interface ZYScrollViewOptionalView () <UIScrollViewDelegate>
/**创建滚动控件*/
@property (nonatomic,weak) UIScrollView *scrollview;
/**创建图层*/
@property (nonatomic,weak) CALayer *lineLayer;
/**创建下坐标*/
@property (nonatomic,assign) NSInteger currentIndex;


@end
@implementation ZYScrollViewOptionalView
#pragma mark - 懒加载
- (UIScrollView *)scrollview {
    if (!_scrollview) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.delegate = self;
        [self addSubview:scrollView];
        _scrollview = scrollView;
        scrollView.backgroundColor = [UIColor clearColor];
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        
    }
    return _scrollview;
    
}

- (CALayer *)lineLayer {
    if (!_lineLayer) {
        CALayer *line = [CALayer layer];
        [self.scrollview.layer addSublayer:line];
        line.backgroundColor = [UIColor greenColor].CGColor;
        _lineLayer = line;
    }
    return _lineLayer;
    
}
//setter 方法 设置偏移量
- (void)setContentOffset:(CGPoint)contentOffset {
    _contentOffset = contentOffset;
    
    CGFloat offsetX = contentOffset.x;
    //当前索引
    NSInteger index = offsetX / kScreenWidth;
    ZYHeaderOptionViewLabel *leftItemView = (ZYHeaderOptionViewLabel *)[self.scrollview viewWithTag:index + 1];
    // 下一个按钮 如果rightBtnLeftDelta > 0则下一个按钮开始渲染

    ZYHeaderOptionViewLabel *rightItemView = (ZYHeaderOptionViewLabel *)[self.scrollview viewWithTag:index + 2];
  
    //相对于当前屏幕的宽度
    CGFloat rightPageLeftDeleta = offsetX - index * kScreenWidth;
    CGFloat progress = rightPageLeftDeleta / kScreenWidth;
    
    if ([leftItemView isKindOfClass:[ZYHeaderOptionViewLabel class]]) {
        leftItemView.textColor = [UIColor redColor];
        leftItemView.fillColor = [UIColor blueColor];
        leftItemView.progress = progress;
        
    }
    
    if ([rightItemView isKindOfClass:[ZYHeaderOptionViewLabel class]]) {
        rightItemView.textColor = [UIColor yellowColor];
        rightItemView.fillColor = [UIColor brownColor];
        rightItemView.progress = progress;
        
    }
    
    for (ZYHeaderOptionViewLabel *itemLabel in self.scrollview.subviews) {
        if (itemLabel.tag != index + 1 && itemLabel.tag != index + 2) {
            itemLabel.textColor = [UIColor blackColor];
            itemLabel.fillColor = [UIColor blueColor];
            itemLabel.progress = 0.0;
            
        }
    }
    
    //重置当前索引
    self.currentIndex = index;
    
}

- (void)setTitles:(NSArray<NSString *> *)titles {
    _titles = titles;
    //标题
    if (titles.count) {
        for (int i = 0; i < titles.count; i++) {
            ZYHeaderOptionViewLabel *itemLabel = [[ZYHeaderOptionViewLabel alloc] init];
            [self.scrollview addSubview:itemLabel];
            itemLabel.text = titles[i];
            itemLabel.tag = i + 1;
            itemLabel.textAlignment = NSTextAlignmentCenter;
            itemLabel.userInteractionEnabled = YES;
            [itemLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTapGesture:)]];
            
        }
    }
    //设置
    if (self.titles.count) {
        self.scrollview.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - (1 - [UIScreen mainScreen].scale));
        
        self.scrollview.contentSize = CGSizeMake(60 * self.titles.count, self.scrollview.frame.size.height - (1- [UIScreen mainScreen].scale));
                                                 
        CGFloat btnW = self.scrollview.frame.size.width / titles.count;
        for (int i = 0; i < self.titles.count; i ++ ) {
            ZYHeaderOptionViewLabel *itemLabel = (ZYHeaderOptionViewLabel *)[self.scrollview viewWithTag:i + 1];
            itemLabel.frame = CGRectMake(btnW * i, 0, btnW, self.scrollview.frame.size.height);
        }
        
    }
    
    //分割线
    self.lineLayer.frame = CGRectMake(0, self.scrollview.frame.size.height - (1 - [UIScreen mainScreen].scale), kScreenWidth, kScreenHeight);
    
}
#pragma mark  - 点击事件
- (void)itemTapGesture:(UITapGestureRecognizer *)tapGest {
    ZYHeaderOptionViewLabel *itemLabel = (ZYHeaderOptionViewLabel *)tapGest.view;
    if (itemLabel) {
        if (self.scrollviewOptionViewItemClickHandle) {
            self.scrollviewOptionViewItemClickHandle(self,itemLabel.text,itemLabel.tag - 1);
        }
        self.currentIndex = itemLabel.tag - 1;
        
    }
    
    
}
@end
