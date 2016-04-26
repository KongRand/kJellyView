//
//  ViewController.m
//  KJellyAnimation
//
//  Created by Kong on 16/4/15.
//  Copyright © 2016年 lq. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "KJellyView.h"
#import <objc/runtime.h>
#import <pthread/pthread.h>
#import "KJellyView.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *jellyViewControlButton;

@property (nonatomic, strong) CAShapeLayer *jellyShapeLayer;

@property (nonatomic, strong) UIView *jellyView;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, strong) NSString *property;

//=================================================
@property (nonatomic, strong) KJellyView *testjellyView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [self buildTestJellyView];
}
//*********************************************************************************
- (void)buildTestJellyView{
    self.testjellyView = [KJellyView jellyViewWithHeight:300];
    self.testjellyView.timeInteral = 5.0f;
    [self.view addSubview:self.testjellyView];
}

@end
