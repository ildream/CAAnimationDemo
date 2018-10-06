//
//  CABaseAnimation.h
//  CAAnimationDemo
//
//  Created by 王安亚 on 2018/10/5.
//  Copyright © 2018年 ay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CABaseAnimation : NSObject

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
