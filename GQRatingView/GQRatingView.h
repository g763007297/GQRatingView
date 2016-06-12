//
//  GQRatingView.h
//  GQRatingViewDemo
//
//  Created by 高旗 on 16/6/8.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GQRatingView : UIView

/**
 *  initMethod
 *
 *  @param point x y坐标
 *  @param size  单个星星大小
 *
 *  @return GQRatingView
 */
+ (instancetype)initWithPoint:(CGPoint)point withSize:(float)size;

/**
 *  分数是否显示为整数 星星都是整个整个显示
 */
@property (nonatomic, assign) BOOL needIntValue;

/**
 *  默认为NO  星星是否可以点击
 */
@property (nonatomic, assign) BOOL canTouch;

/**
 *  如果touch为YES 这个也可以一起实现
 */
@property (nonatomic, copy) void (^scoreBlock)(NSNumber *scoreNumber);

/**
 *  初始分数    默认满分为5分 0 - 5
 */
@property(nonatomic,copy)NSNumber *scoreNum;

@end
