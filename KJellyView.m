//
//  KJellyView.m
//  KJellyAnimation
//
//  Created by Kong on 16/4/15.
//  Copyright © 2016年 lq. All rights reserved.
//

#import "KJellyView.h"

@interface KJellyView()

@property (nonatomic, strong) UIView *jellyView;
@property (nonatomic, strong) CAShapeLayer * shapeLayer;
@property (nonatomic, strong) CADisplayLink * displayLink;

@end

@implementation KJellyView


- (instancetype)initWithJellyViewWithHeight:(CGFloat)height
{
    self =  [self initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - height, [UIScreen mainScreen].bounds.size.width, height)];
    if (self ){}
    return self;
}

+ (instancetype)jellyViewWithHeight:(CGFloat)height
{
    KJellyView *jellyView = [[self alloc] initWithJellyViewWithHeight:height];
    return jellyView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = CGRectMake(frame.origin.x, [UIScreen mainScreen].bounds.size.height, frame.size.width, frame.size.height);
        [UIView animateWithDuration:0.5f animations:^{
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
        }];
        [self buildjellyLittleView];
        [self buildShapeLayer];
        [self buildDisplayLink];
    }
    return self;
}

- (void)buildjellyLittleView
{
    self.jellyView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 1, 0, 0, 0)];
    [self addSubview:self.jellyView];
}
#pragma mark - CADisplayLink
- (void)buildDisplayLink
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(jellyViewDisplayLink)];
    self.displayLink.paused = NO;
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

#pragma mark - CAShapeLayer
- (void)buildShapeLayer
{
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.fillColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:self.shapeLayer];
    self.jellyView.frame = CGRectMake(self.frame.size.width/2, self.elasticitySize?self.elasticitySize:350, 2, 2);
    NSTimeInterval timeInterval = self.timeInteral?self.timeInteral:3.0f;
    [UIView animateWithDuration:timeInterval delay:0.0 usingSpringWithDamping:0.25f initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.jellyView.frame = CGRectMake(self.frame.size.width/2 - 1, 0, 2, 2);
                     } completion:^(BOOL finished) {
                         self.displayLink.paused = YES;
                     }];
}

#pragma mark - BuildLayerPath
- (CGPathRef )buildLayerPathWithPoint:(CGPoint )point
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(0, 0)];
    [bezierPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [bezierPath addQuadCurveToPoint:CGPointMake(0, 0) controlPoint:point];
    [bezierPath closePath];
    return bezierPath.CGPath;
}
//#pragma mark - BuildLayerPath
- (void)jellyViewDisplayLink
{
    CALayer *layer = self.jellyView.layer.presentationLayer;
    self.shapeLayer.path = [self buildLayerPathWithPoint:layer.position];
}

@end
