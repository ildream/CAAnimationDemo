//
//  CABaseAnimation.m
//  CAAnimationDemo
//
//  Created by 王安亚 on 2018/10/5.
//  Copyright © 2018年 ay. All rights reserved.
//

#import "CABaseAnimation.h"

@implementation CABaseAnimation

- (void)startAnimation
{
    //具体实现放在子类里面
    NSLog(@"startAnimation具体实现放在子类里面");
}

- (void)suspendedAnimation
{
    //具体实现放在子类里面
    NSLog(@"suspendedAnimation具体实现放在子类里面");
}

- (void)resumeAnimation
{
     //具体实现放在子类里面
    NSLog(@"resumeAnimation具体实现放在子类里面");
}

- (void)stopAnimation
{
     //具体实现放在子类里面
    NSLog(@"stopAnimation具体实现放在子类里面");
}

@end
