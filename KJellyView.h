//
//  KJellyView.h
//  KJellyAnimation
//
//  Created by Kong on 16/4/15.
//  Copyright © 2016年 lq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KJellyView : UIView
/**
 *  初始化方法
 */
- (instancetype )initWithJellyViewWithHeight:(CGFloat )height;

+ (instancetype )jellyViewWithHeight:(CGFloat )height;

/**
 *  属性
 */
@property (nonatomic, assign) CGFloat elasticitySize;
@property (nonatomic, assign) NSTimeInterval timeInteral;

@end
