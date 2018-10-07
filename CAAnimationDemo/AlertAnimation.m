//
//  AlertAnimation.m
//  CAAnimationDemo
//
//  Created by anya on 2018/10/7.
//  Copyright © 2018年 ay. All rights reserved.
//

#import "AlertAnimation.h"

@interface AlertAnimation()

@property (nonatomic, assign) CGRect alertViewFrame;
@property (nonatomic, strong) UIView *alertView;

@end

@implementation AlertAnimation

- (instancetype)initWithFrame:(CGRect)frame
{
    self.alertViewFrame = frame;
    _alertView = [[UIView alloc] initWithFrame:frame];
    return self;
}

- (void)startAnimation
{
    
}

- (void)stopAnimation
{
    
}

- (void)suspendedAnimation
{
    
}

- (void)resumeAnimation
{
    
}

#pragma mark -setters & getters

- (void)set_backgroundColor:(UIColor *)_backgroundColor
{
    if (!_backgroundColor)  return;
    
    self.alertView.backgroundColor = _backgroundColor;
}


@end
