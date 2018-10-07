//
//  CABaseAnimation.h
//  CAAnimationDemo
//
//  Created by anya on 2018/10/5.
//  Copyright © 2018年 ay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CABaseAnimation : NSObject

- (instancetype)initWithFrame:(CGRect)frame;

/**
 开始动画
 */
- (void)startAnimation;

/**
 暂停动画
 */
- (void)suspendedAnimation;

/**
 恢复动画
 */
- (void)resumeAnimation;

/**
 停止动画
 */
- (void)stopAnimation;

@end
