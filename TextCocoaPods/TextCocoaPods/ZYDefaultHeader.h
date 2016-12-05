//默认头文件

#ifndef ZYDefaultHeader_h
#define ZYDefaultHeader_h

#define weakSelf(weakSelf) __weak __typeof(&*self)weakSelf = self;

/***  当前屏幕宽度 */
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
/***  当前屏幕高度 */
#define kScreenHeight  [[UIScreen mainScreen] bounds].size.height






#endif /* ZYDefaultHeader_h */
