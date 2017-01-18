//
//  DetailViewController.m
//  GQRatingViewDemo
//
//  Created by 高旗 on 16/6/12.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "DetailViewController.h"

#import "GQRatingView.h"

#define GQRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:arc4random_uniform(255)/255.0]

@interface DetailViewController ()

@property (nonatomic, strong) GQRatingView *ratingView;
@property (nonatomic, strong) GQRatingView *ratingView1;
@end

@implementation DetailViewController

- (void)configureView {
    
    self.navigationController.visibleViewController.title = @"五星好评返现5元";
    
    //链式调用
    _ratingView = [GQRatingView init]
    .frameChain(CGPointMake(50, 100),50)
    .canTouchChain(YES)
    .needIntValueChain(NO)
    .scoreNumChain(@3)
    .scroreBlockChain(^(NSNumber *scoreNumber){
//        NSLog(@"%@",scoreNumber);
    }).superViewChain(self.view);
    
    //链式调用
    _ratingView1 = [GQRatingView init]
    .frameChain(CGPointMake(50, 170),50)
    .canTouchChain(NO)
    .needIntValueChain(NO)
    .scoreNumChain(@3)
    .scroreBlockChain(^(NSNumber *scoreNumber){
//        NSLog(@"%@",scoreNumber);
    }).superViewChain(self.view);
    
    //普通用法
//    GQRatingView *fiveStar = [GQRatingView initWithPoint:CGPointMake(50, 100) withSize:50];
//    fiveStar.canTouch = YES;
//    fiveStar.needIntValue = YES;
//    fiveStar.scoreNum = [NSNumber numberWithInt:5];
//    fiveStar.scroreBlock = ^(NSNumber *scoreNumber){
//        NSLog(@"%@",scoreNumber);
//    };
//    [self.view addSubview:fiveStar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, 300, 200, 30);
    [btn setTitle:@"随机切换颜色" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction:(id)sender {
    _ratingView.normalColorChain(GQRandomColor);
    _ratingView.highlightColorChian(GQRandomColor);
    
    _ratingView1.normalColorChain(GQRandomColor);
    _ratingView1.highlightColorChian(GQRandomColor);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
