 [![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/angelcs1990/GQGesVCTransition/master/LICENSE)&nbsp;
[![](https://img.shields.io/badge/platform-iOS-brightgreen.svg)](http://cocoapods.org/?q=GQGesVCTransition)&nbsp;
[![support](https://img.shields.io/badge/support-iOS6.0%2B-blue.svg)](https://www.apple.com/nl/ios/)&nbsp;

# GQRatingView
五星评分RatingView，支持拖拽点击评分，可自定义五角星样式,支持链式调用。

## Overview

![Demo Overview](https://github.com/g763007297/GQRatingView/blob/master/ScreenShot/demo.gif)

## CocoaPods

1.在 Podfile 中添加 pod 'GQRatingView'。

2.执行 pod install 或 pod update。

3.导入 GQRatingView.h。

## Basic usage

1.下载 GQRatingView 文件夹内的所有.h和.m文件。

2.将 GQRatingView 内的源文件添加(拖放)到你的工程。

3.在需要用到的地方引用头文件 GQRatingView.h。

4.添加代码：

``` objc
    //链式调用
    [GQRatingView init]
    .frameChain(CGPointMake(50, 100),50)
    .canTouchChain(YES)
    .needIntValueChain(YES)
    .scoreNumChain(@5)
    .scroreBlockChain(^(NSNumber *scoreNumber){
        NSLog(@"%@",scoreNumber);
    }).superViewChain(self.view);

    //普通用法
    GQRatingView *fiveStar = [GQRatingView initWithPoint:CGPointMake(50, 100) withSize:50];
    
    fiveStar.canTouch = YES;//设置可以触摸
    
    fiveStar.needIntValue = NO;//设置不需要整数分数
    
    fiveStar.scoreNum = [NSNumber numberWithInt:5];//设置初始化分数
    
    fiveStar.scoreBlock = ^(float number){//返回的分数
        
        NSLog(@"%.1f",number);
        
    };
    
    [self.view addSubview:fiveStar];
```

##Support

欢迎指出bug或者需要改善的地方，欢迎提出issues，或者联系qq：763007297， 我会及时的做出回应，觉得好用的话不妨给个star吧，你的每个star是我持续维护的强大动力。
