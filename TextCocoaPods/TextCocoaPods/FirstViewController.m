
//
//  FirstViewController.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/11/29.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "FirstViewController.h"
#import "NHCustomSegmentView.h"
#import "ZYCustomSegumentView.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "ZYScrollViewOptionalView.h"
#import "ZYDefaultHeader.h"
//#import "NHServiceListModel.h"

@interface FirstViewController ()
/**创*/
@property (nonatomic,weak) AViewController *aVC;
@property (nonatomic,weak) BViewController *bVC;
@property (nonatomic,weak) CViewController *cVC;
/**创建*/
@property (nonatomic,weak) ZYScrollViewOptionalView *optionView;
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *urls;

@end

@implementation FirstViewController

- (NSMutableArray *)titles {
    if (!_titles) {
        _titles = [NSMutableArray new];
    }
    return _titles;
}
- (NSMutableArray *)urls {
    if (!_urls) {
        _urls = [NSMutableArray new];
    }
    return _urls;
}
// 设置数据
//- (void)setModels:(NSArray <NHServiceListModel *> *)models {
////    if (models.count == 0) {
//        return ;
//    }
//    for (NHServiceListModel *model in models) {
//        if ([model.name isKindOfClass:[NSString class]]) {
//            [self.titles addObject:model.name];
//        }
//        if ([model.url isKindOfClass:[NSString class]]) {
//            [self.urls addObject:model.url];
//        }
//    }
//    // 设置子视图
////    [self setUpViews];
//}

//// 设置子视图
//- (void)setUpViews {
//    
//    if (self.titles.count == 0) {
//        return ;
//    }
//    if (self.titles.count != self.urls.count) {
//        return ;
//    }
//    for (int i = 0; i < self.urls.count; i++) {
//        NSString *url = self.urls[i];
//        NSString *title = self.titles[i];
//        if ([title isEqualToString:@"游戏"] ) {
//            NHCustomWebViewController *controller = [[NHCustomWebViewController alloc] initWithUrl:url];
//            [self.controllers addObject:controller];
//        } else if ([title isEqualToString:@"精华"]) {
//        } else {
//            NHHomeBaseViewController *homeBase = [[NHHomeBaseViewController alloc] initWithUrl:url];
//            [self.controllers addObject:homeBase];
//        }
//    }
//    if ([self.titles containsObject:@"精华"]) {
//        [self.titles removeObject:@"精华"];
//    }
//    WeakSelf(weakSelf);
//    self.optionalView.titles = self.titles.copy;
//    self.optionalView.homeHeaderOptionalViewItemClickHandle = ^(NHHomeHeaderOptionalView *view, NSString *currentTitle, NSInteger currentIndex) {
//        weakSelf.slideViewController.seletedIndex = currentIndex;
//    };
//    [self.slideViewController reloadData];
//    
//}


- (void)viewDidLoad {
    [super viewDidLoad];

self.title = @"这是个事假";
    //设置头部分类点击
    [self headerSegument];
    



}
- (void)headerSegument {
    __weak typeof(self) weakSelf = self;
    ZYCustomSegumentView *nhCustomSegumentV = [[ZYCustomSegumentView alloc] initWithItemTitlesArray:@[@"精选",@"关注",@"牛逼"]];
//    self.navigationItem.titleView = nhCustomSegumentV;
    nhCustomSegumentV.frame = CGRectMake(100, 64, 130, 35);
    
    [self.view addSubview:nhCustomSegumentV];

    nhCustomSegumentV.ZYCustomSegmentBtnClickHandle = ^(ZYCustomSegumentView *zyCustomSegument,NSString *currentTitle,NSInteger currentIntrger) {
        BOOL isfeatured = (currentIntrger == 0);
       weakSelf.optionView.hidden =  weakSelf.aVC.view.hidden = !isfeatured;
        weakSelf.bVC.view.hidden = isfeatured;
    };
    [nhCustomSegumentV clickDefault];

    
    
    // 发布
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"submission"] style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick)];
    
}
- (void)rightItemClick {
    CViewController *cVC = [[CViewController alloc] init];
    [self.navigationController pushViewController:cVC animated:YES];
}
//- (void)changeChildVcWithCurrentIndex:(NSInteger)currentIndex {
//    BOOL isoption = (currentIndex == 0);
//    
//    if (is) {
//        <#statements#>
//    }
//    
//}
- (AViewController *)aVC {
    if (!_aVC) {
     AViewController   * avc = [[AViewController alloc] init];
        [avc willMoveToParentViewController:self];
        [self addChildViewController:avc];
        [self.view addSubview:avc.view];
        avc.view.frame = CGRectMake(0, 100, 300, 300);
        _aVC= avc;
        
        
    }
    return _aVC;
    
}
- (BViewController *)bVC {
    if (!_bVC) {
        BViewController   * bvc = [[BViewController alloc] init];
        [bvc willMoveToParentViewController:self];
        [self addChildViewController:bvc];
        [self.view addSubview:bvc.view];
        bvc.view.frame = CGRectMake(0, 100, 300, 300);
        _bVC= bvc;
        
        
    }
    return _bVC;
    
}
- (CViewController *)cVC {
    if (!_cVC) {
        CViewController   * cvc = [[CViewController alloc] init];
        [cvc willMoveToParentViewController:self];
        [self addChildViewController:cvc];
        [self.view addSubview:cvc.view];
        cvc.view.frame = CGRectMake(0, 0, 300, 300);
        _cVC= cvc;
        
        
    }
    return _cVC;
    
}
- (ZYScrollViewOptionalView *)optionView {
    if (!_optionView) {
        ZYScrollViewOptionalView  *scrollView = [[ZYScrollViewOptionalView alloc] init];
        scrollView.frame = CGRectMake(0, 64, kScreenWidth, 25);
        scrollView.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:scrollView];
        _optionView= scrollView;
        
    }
    return _optionView;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
