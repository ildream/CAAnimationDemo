//
//  AlertAnimation.h
//  CAAnimationDemo
//
//  Created by anya on 2018/10/7.
//  Copyright © 2018年 ay. All rights reserved.
//

#import "CABaseAnimation.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlertAnimation : CABaseAnimation

@property (nonatomic, assign) CGFloat duration;//动画时间
@property (nonatomic, assign) id aniType;//动画类型
@property (nonatomic, strong) UIColor *_backgroundColor;

@end

NS_ASSUME_NONNULL_END
