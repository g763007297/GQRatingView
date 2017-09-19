//
//  GQRatingView.h
//  GQRatingViewDemo
//
//  Created by 高旗 on 16/6/8.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GQScoreBlock)(NSNumber *scoreNumber);

@class GQRatingView;

typedef GQRatingView * (^GQFrameChain)          (CGPoint point, float size);
typedef GQRatingView * (^GQNeedIntValueChain)   (BOOL needIntValue);
typedef GQRatingView * (^GQCanTouchChain)       (BOOL canTouch);
typedef GQRatingView * (^GQScroreBlockChain)    (GQScoreBlock scroreBlock);
typedef GQRatingView * (^GQScoreNumChain)       (NSNumber *scoreNum);
typedef GQRatingView * (^GQSuperViewChain)      (UIView *superView);
typedef GQRatingView * (^GQColorChain)          (UIColor *color);

@interface GQRatingView : UIView

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

#pragma mark -- 链式调用
/**
 *  链式调用
 *
 *  @return GQRatingView
 */
+ (instancetype)init;

/**
 *  设置point和size   传值 : frameChain(CGPoint,float)
 */
@property (nonatomic, copy, readonly) GQFrameChain          frameChain;

/**
 *  分数是否显示为整数 如果为yes星星都是整个整个显示   needIntValueChain(BOOL)
 */
@property (nonatomic, copy, readonly) GQNeedIntValueChain   needIntValueChain;

/**
 *  默认为NO  星星是否可以点击   canTouchChain(BOOL)
 */
@property (nonatomic, copy, readonly) GQCanTouchChain       canTouchChain;

/**
 *  如果touch为YES 这个也可以一起实现  scroreBlockChain(GQScoreBlock)
 */
@property (nonatomic, copy, readonly) GQScroreBlockChain    scroreBlockChain;

/**
 *  初始分数    默认满分为5分 0 - 5   scoreNumChain(NSNumber *)
 */
@property (nonatomic, copy, readonly) GQScoreNumChain       scoreNumChain;

/**
 底色  默认为[UIColor grayColor]
 */
@property (nonatomic, copy, readonly) GQColorChain          normalColorChain;

/**
 高亮色 默认为[UIColor yellowColor]
 */
@property (nonatomic, copy, readonly) GQColorChain          highlightColorChian;

/**
 *  显示在哪个view上面   superViewChain(UIView *)
 */
@property (nonatomic, copy, readonly) GQSuperViewChain      superViewChain;

#pragma mark -- 方法调用

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
 *  分数是否显示为整数 如果为yes星星都是整个整个显示
 */
@property (nonatomic, assign) BOOL needIntValue;

/**
 *  默认为NO  星星是否可以点击
 */
@property (nonatomic, assign) BOOL canTouch;

/**
 *  如果touch为YES 这个也可以一起实现
 */
@property (nonatomic, copy) GQScoreBlock scroreBlock;

/**
 *  初始分数  默认满分为5分 0 - 5
 */
@property (nonatomic,strong) NSNumber *scoreNum;

/**
 设置底色 默认为grayColor
 */
@property (nonatomic, strong) UIColor *normalColor;

/**
 设置高亮颜色  默认为yellowColor
 */
@property (nonatomic, strong) UIColor *highlightColor;

@end
