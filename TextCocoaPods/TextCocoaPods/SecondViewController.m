
//
//  SecondViewController.m
//  TextCocoaPods
//
//  Created by QingZhi on 2016/12/1.
//  Copyright © 2016年 QZ. All rights reserved.
//

#import "SecondViewController.h"
#import "ZYCustomSegumentView.h"

#import "AViewController.h"
#import "BViewController.h"

@interface SecondViewController ()

@property (nonatomic,weak) AViewController *aVC;
@property (nonatomic,weak) BViewController *bVC;
@end

@implementation SecondViewController
- (AViewController *)aVC {
    if (!_aVC) {
        AViewController   * avc = [[AViewController alloc] init];
        [self addChildVc:_aVC];

        avc.view.frame = CGRectMake(0, 100, 300, 300);
        _aVC= avc;
        
        
    }
    return _aVC;
    
}
- (BViewController *)bVC {
    if (!_bVC) {
        BViewController   * bvc = [[BViewController alloc] init];
        [self addChildVc:_bVC];

        bvc.view.frame = CGRectMake(0, 100, 300, 300);
        _bVC= bvc;
        
        
    }
    return _bVC;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self headerSegument];
    

}

- (void)headerSegument {
    __weak typeof(self) weakSelf = self;
    ZYCustomSegumentView *nhCustomSegumentV = [[ZYCustomSegumentView alloc] initWithItemTitlesArray:@[@"精选",@"关注"]];
    self.navigationItem.titleView = nhCustomSegumentV;
    nhCustomSegumentV.frame = CGRectMake(0, 0, 130, 35);
    
    //    [self.view addSubview:nhCustomSegumentV];
    
    nhCustomSegumentV.ZYCustomSegmentBtnClickHandle = ^(ZYCustomSegumentView *zyCustomSegument,NSString *currentTitle,NSInteger currentIntrger) {
        [weakSelf changeChildVcWithCurrentIndex:currentIntrger];

    };
    [nhCustomSegumentV clickDefault];

    
    
}

- (void)changeChildVcWithCurrentIndex :(NSInteger)currentIndex {
    BOOL isHot = (currentIndex == 0);
    
    if (isHot) { // 热门
        [self addChildVc:self.aVC];
        [self removeChildVc:self.bVC];
    } else { // 订阅
        [self addChildVc:self.bVC];
        [self removeChildVc:self.aVC];
    }
}
@end
