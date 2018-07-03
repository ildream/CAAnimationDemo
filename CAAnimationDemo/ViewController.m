//
//  ViewController.m
//  CAAnimationDemo
//
//  Created by anya on 2018/7/2.
//  Copyright © 2018年 ay. All rights reserved.
//

#import "ViewController.h"

#define ScreenH  UIScreen.mainScreen.bounds.size.height
#define ScreenW  UIScreen.mainScreen.bounds.size.width

@interface ViewController ()<CAAnimationDelegate>

@property (nonatomic, strong) UIView *containerView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.containerView];
}

- (UIView *)containerView
{
    if (_containerView == nil) {
        
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, ScreenW, ScreenH - 100*2)];
        _containerView.backgroundColor = [UIColor colorWithRed:0.91 green:0.91 blue:0.91 alpha:1];
    }
    return _containerView;
}

//MARK:改变layer的cornerRadius
- (void)setCRWithBasicAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, 40, self.containerView.bounds.size.width - 30 *2,  self.containerView.bounds.size.height - 40*2);
    layer.backgroundColor = UIColor.brownColor.CGColor;
    [self.containerView.layer addSublayer:layer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    basicAnimation.fromValue = @(0);
    basicAnimation.toValue = @(80);
    basicAnimation.duration = 2.f;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.removedOnCompletion = NO;
    [layer addAnimation:basicAnimation forKey:@"basicAni"];
}

//MARK:改变layer的backgroundColor
- (void)setBgColorWithBasicAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(30, 40, self.containerView.bounds.size.width - 30 *2,  self.containerView.bounds.size.height - 40*2);
    layer.backgroundColor = UIColor.brownColor.CGColor;
    [self.containerView.layer addSublayer:layer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimation.fromValue = (id)[UIColor colorWithRed:0.6 green:0.1 blue:0.5 alpha:1].CGColor;
    basicAnimation.toValue = (id)[UIColor colorWithRed:0.1 green:0.6 blue:0.7 alpha:1].CGColor;
    basicAnimation.duration = 2.f;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.removedOnCompletion = NO;
    [layer addAnimation:basicAnimation forKey:@"basicAniColor"];
}

//MARK:使用keyAnimation 改变 layer的position
- (void)changePositionWithKeyAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(ScreenW, (self.containerView.bounds.size.height - 40)/2.0, 240,  40);
    layer.cornerRadius = 20;
    layer.backgroundColor = [UIColor colorWithRed:0.3 green:0.8 blue:0.5 alpha:1].CGColor;
    [self.containerView.layer addSublayer:layer];

    CGPoint startP = CGPointMake(ScreenW+layer.bounds.size.width/2, layer.position.y);
    CGPoint middelP = CGPointMake(layer.bounds.size.width/2+20, layer.position.y);
    CGPoint endP = CGPointMake(-ScreenW, layer.position.y);
    
    CAKeyframeAnimation *keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    keyFrameAni.values = @[
                           [NSValue valueWithCGPoint:startP],
                           [NSValue valueWithCGPoint:middelP],
                           [NSValue valueWithCGPoint:middelP],
                           [NSValue valueWithCGPoint:endP]
                           ];
    keyFrameAni.keyTimes = @[@0,@0.2,@0.8,@1];
    keyFrameAni.duration = 2.0f;
    keyFrameAni.fillMode = kCAFillModeForwards;
    keyFrameAni.removedOnCompletion = NO;
    keyFrameAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [layer addAnimation:keyFrameAni forKey:@"kfAnimation"];
}

//MARK:使用keyAnimation 改变 layer的rotation
- (void)changeRotationWithKeyAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100, (self.containerView.bounds.size.height - 100)/2.0, self.containerView.bounds.size.width - 100*2,  100);
    layer.cornerRadius = 20;
    layer.backgroundColor = [UIColor colorWithRed:0.4 green:0.8 blue:0.1 alpha:1].CGColor;
    [self.containerView.layer addSublayer:layer];
    
    //这个keypath 记住是：transform.rotation.z  transform 不要忘了写
    CAKeyframeAnimation *keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    keyFrameAni.values = @[@(M_PI_4),@(M_PI_2),@(-M_PI),@(1.5*M_PI)];
    keyFrameAni.keyTimes = @[@0,@0.35,@0.75,@1];
    keyFrameAni.duration = 3.5f;
    keyFrameAni.fillMode = kCAFillModeBoth;
    keyFrameAni.removedOnCompletion = NO;
    keyFrameAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [layer addAnimation:keyFrameAni forKey:@"kfAnimationRotation"];
}

//MARK: 使用path属性结合贝塞尔曲线做椭圆运动。
- (void)changePathWithKeyAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(80, (self.containerView.bounds.size.height - 40)/2.0, 40,  40);
    layer.cornerRadius = 20;
    layer.backgroundColor = [UIColor colorWithRed:0.3 green:0.8 blue:0.5 alpha:1].CGColor;
    [self.containerView.layer addSublayer:layer];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 40, ScreenW - 40, ScreenH - 300)];
    CAKeyframeAnimation *keyFrameAni = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyFrameAni.path = path.CGPath;
    keyFrameAni.duration = 2.0f;
    keyFrameAni.repeatCount = 1000;
    [layer addAnimation:keyFrameAni forKey:@"kfAnimation"];
}


//MARK: 使用CASpringAnimation 做了一个弹窗点击缩放的弹簧效果
- (void)springAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, (self.containerView.bounds.size.height - 180)/2.0, self.containerView.bounds.size.width - 50*2,  180);
    layer.cornerRadius = 20;
    layer.backgroundColor = [UIColor colorWithRed:0.9 green:0.8 blue:0.1 alpha:1].CGColor;
    [self.containerView.layer addSublayer:layer];
    
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    springAnimation.fromValue = @(0.95);
    springAnimation.toValue = @(1);
    springAnimation.mass = 1; //质量越大，惯性越大
    springAnimation.stiffness = 50; //劲度系数，值越大，运动的越快
    springAnimation.damping = 10;//阻尼系数 值越大 停止的越快
    springAnimation.initialVelocity = 50;//初始速度
    springAnimation.duration = springAnimation.settlingDuration;
    springAnimation.fillMode = kCAFillModeBoth;
    springAnimation.removedOnCompletion = NO;
    [layer addAnimation:springAnimation forKey:@"springAnimation"];
}

//MARK: 使用CAAnimationGroup 做一个 位移+背景变换 + 缩放的弹簧效果
- (void)groupAnimation {
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(50, (self.containerView.bounds.size.height - 180)/2.0, self.containerView.bounds.size.width - 50*2,  180);
    layer.cornerRadius = 20;
    layer.backgroundColor = [UIColor colorWithRed:0.9 green:0.8 blue:0.1 alpha:1].CGColor;
    [self.containerView.layer addSublayer:layer];
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(layer.position.x, ScreenH + layer.bounds.size.height/2.0)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(layer.position.x, layer.bounds.size.height/2.0 + 80)];;
    basicAnimation.duration = 2.f;
    basicAnimation.fillMode = kCAFillModeForwards;
    basicAnimation.removedOnCompletion = NO;
    
    CABasicAnimation *basicAnimation1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    basicAnimation1.fromValue = (id)[UIColor colorWithRed:0.6 green:0.1 blue:0.5 alpha:1].CGColor;
    basicAnimation1.toValue = (id)[UIColor colorWithRed:0.1 green:0.6 blue:0.7 alpha:1].CGColor;
    basicAnimation1.duration = 2.0f;
    basicAnimation1.fillMode = kCAFillModeForwards;
    basicAnimation1.removedOnCompletion = NO;
    
    CASpringAnimation *springAnimation = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
    springAnimation.fromValue = @(0.95);
    springAnimation.toValue = @(1);
    springAnimation.mass = 1; //质量越大，惯性越大
    springAnimation.stiffness = 50; //劲度系数，值越大，运动的越快
    springAnimation.damping = 10;//阻尼系数 值越大 停止的越快
    springAnimation.initialVelocity = 50;//初始速度
    springAnimation.duration = springAnimation.settlingDuration;
    springAnimation.beginTime = 2.3f;
    springAnimation.fillMode = kCAFillModeForwards;
    springAnimation.removedOnCompletion = NO;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.duration = springAnimation.settlingDuration + 2.0f;
    //这个里面的动画，没有先后顺序，可以设置beginTime动画组里的动画有先后顺序
    groupAnimation.animations = @[springAnimation, basicAnimation,basicAnimation1];
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    [layer addAnimation:groupAnimation forKey:@"groupAnimation"];
}

//MARK:CATransition 过渡动画
- (void)imageTransition {
    
    UIImageView *img1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv1.jpeg"]];
    img1.frame = CGRectMake(0, 50, self.containerView.bounds.size.width ,  (self.containerView.bounds.size.height - 100));
    img1.contentMode = UIViewContentModeScaleAspectFill;
    [self.containerView addSubview:img1];
    
    UIImageView *img2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"meinv2.jpeg"]];
    img2.frame = CGRectMake(0, 50, self.containerView.bounds.size.width ,  (self.containerView.bounds.size.height - 100));
    img2.contentMode = UIViewContentModeScaleAspectFill;
    [self.containerView addSubview:img2];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CATransition *transition = [CATransition animation];
        transition.startProgress = 0.0f;
        transition.endProgress = 1.0f;
        transition.duration = 1.5f;
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromLeft;
        transition.fillMode = kCAFillModeBackwards;
        
        //向两个图层添加动画
        [img1.layer addAnimation:transition forKey:@"transition"];
        [img2.layer addAnimation:transition forKey:@"transition"];
        
        //最后更改两个图层的可见性
        img1.hidden = NO;
        img2.hidden = YES;
    });
}

//MARK: 显示事务
- (void)addTranaction {
    
}


- (IBAction)operationButton:(UIButton *)sender {
  
    for (UIView  *view in self.containerView.subviews) {
        [view removeFromSuperview];
    }
    
    for (CALayer *layer in self.containerView.layer.sublayers) {
        [layer removeFromSuperlayer];
    }
    
//    [self setCRWithBasicAnimation];
//    [self setBgColorWithBasicAnimation];
//    [self changePositionWithKeyAnimation];
    [self changeRotationWithKeyAnimation];
//    [self changePathWithKeyAnimation];
//    [self springAnimation];
//    [self groupAnimation];
//    [self imageTransition];
}


#pragma -mark   CAAnimationDelegate
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"动画开始");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"动画结束");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
