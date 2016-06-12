//
//  DetailViewController.m
//  GQRatingViewDemo
//
//  Created by 高旗 on 16/6/12.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "DetailViewController.h"

#import "GQRatingView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    
    self.navigationController.visibleViewController.title = @"五星好评返现5元";
    
    GQRatingView *fiveStar = [GQRatingView initWithPoint:CGPointMake(50, 100) withSize:50];
    
    fiveStar.canTouch = YES;
    
    fiveStar.needIntValue = NO;
    
    fiveStar.scoreNum = [NSNumber numberWithInt:5];
    
    fiveStar.scoreBlock = ^(float number){
        
        NSLog(@"%.1f",number);
        
    };
    
    [self.view addSubview:fiveStar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
