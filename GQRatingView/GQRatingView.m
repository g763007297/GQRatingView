//
//  GQRatingView.m
//  GQRatingViewDemo
//
//  Created by 高旗 on 16/6/8.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQRatingView.h"
#import "GQStarView.h"

#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
#define intToLong long
#define StringFormat(x) [NSString stringWithFormat:@"%ld",(long)x]
#else
#define intToLong int
#define StringFormat(x) [NSString stringWithFormat:@"%d",x]
#endif

static float kRatingLabelWidth = 30;  //星星默认宽度

static NSString *scoreFormat = @"0.0";//分数格式化样式 依据四舍五入

//格式化小数 四舍五入类型
extern float decimalwithFormat(NSString * format, float floatV) {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [[numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]] floatValue];
}

@interface GQRatingView(){
    UIView *_yelloView; //金色星星视图
    UIView *_grayView;  //灰色星星
}

@end

@implementation GQRatingView

+ (instancetype)init
{
    return [[self alloc] init];
}

+ (instancetype)initWithPoint:(CGPoint)point withSize:(float)size
{
    return [[self alloc] initWithPoint:point withSize:size];
}

- (instancetype)initWithPoint:(CGPoint)point withSize:(float)size
{
    self = [super initWithFrame:CGRectMake(point.x, point.y, size, size)];
    if (self) {
        [self _initViews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initViews];
    }
    return self;
}

- (void)awakeFromNib
{
    [self _initViews];
}

- (void)_initViews
{
    /* 显示五个星星设计原理
     图片只提供了一个星星，要显示五个星星：
     首先，压缩一个星星图片为固定大小。使用colorWithPatternImage把一个星星当成color传进去，然后再设置图片的仿射变换，缩放比率用固定的大小除以图片原来的大小，这样不管一个星星图片有多大，始终显示为固定的大小。
     其次，使用colorWithPatternImage方法的时候，当图片的大小 小于等于 要设置的视图的大小的时候，图片会平铺，这样就达到了显示五个星星的目的。
     这样设计更精炼，无需太多代码和复杂的逻辑
     */
    
    //1.初始化灰色星星
    _grayView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_grayView];
    
    //2.初始化金色星星
    _yelloView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:_yelloView];
    self.userInteractionEnabled = YES;
    
    _canTouch = YES;
    
    _scoreNum = @5;
    
    _needIntValue = NO;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)setScoreNum:(NSNumber *)scoreNum
{
    if (_scoreNum != scoreNum) {
        if ([scoreNum floatValue] > 5.0f) {
            _scoreNum = @5;
        }else if (scoreNum < 0){
            _scoreNum = @0;
        }
        _scoreNum = scoreNum;
    }
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat star5Width = self.frame.size.height * 5;
    CGRect frame = self.frame;
    frame.size.width = _canTouch?star5Width:kRatingLabelWidth +star5Width ;
    self.frame = frame;
    
    //5个星星铺满后的宽度
    CGFloat grayWidth = self.frame.size.height * 5;
    
    //压缩星星
    UIImage *grayImg = [GQStarView getStarWithRadius:self.frame.size.height withFillColor:[UIColor grayColor]];
    
    _grayView.backgroundColor = [UIColor colorWithPatternImage:grayImg];
    _grayView.transform = CGAffineTransformMakeScale(self.frame.size.height/grayImg.size.width, self.frame.size.height/grayImg.size.height);
    
    UIImage *yelloImg = [GQStarView getStarWithRadius:self.frame.size.height withFillColor:[UIColor yellowColor]];
    
    _yelloView.backgroundColor = [UIColor colorWithPatternImage:yelloImg];
    _yelloView.transform = CGAffineTransformMakeScale(self.frame.size.height/yelloImg.size.width, self.frame.size.height/yelloImg.size.height);
    
    _grayView.frame = CGRectMake(0, 0, grayWidth, self.frame.size.height);
    _yelloView.frame = CGRectMake(0, 0, grayWidth, self.frame.size.height);
    
    float score = [_scoreNum floatValue];
    
    //分数的百分比
    float s = score/5;
    //根据分数的百分比调整_yelloView视图的宽度
    CGRect rect = _yelloView.frame;
    rect.size.width = s * grayWidth;
    _yelloView.frame = rect;
}

#pragma mark -- touch event

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self setUpScoreWithTouch:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [self setUpScoreWithTouch:touches];
}

#pragma mark -- 处理touch事件
- (void)setUpScoreWithTouch:(NSSet<UITouch *> *)touches{
    if (!self.canTouch) {
        return;
    }
    
    float weight = self.frame.size.width;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:self];
    
    touchPoint.x = touchPoint.x > weight ? weight : (touchPoint.x < 0 ? 0 : touchPoint.x);
    
    float stringFloat = touchPoint.x;
    
    float a = decimalwithFormat(scoreFormat, 5*stringFloat/weight);
    
    if (_needIntValue) {
        if (a>4) {
            a=5;
        }else if (a>3){
            a=4;
        }else if (a>2){
            a=3;
        }else if (a>1){
            a=2;
        }else{
            a=1;
        }
    }
    
    float score = a;
    
    self.scoreNum = [NSNumber numberWithFloat:score];
    
    [self setNeedsLayout];
    
    if (_scoreBlock) {
        _scoreBlock(score);
    }
}

@end