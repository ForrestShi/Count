//
//  CustomizedSettingTransition.m
//  MyCount
//
//  Created by forrest on 13-10-19.
//  Copyright (c) 2013年 Forrest Shi. All rights reserved.
//

#import "CustomizedSettingTransition.h"

@implementation CustomizedSettingTransition

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext{
    return .5;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];

    float height = fromVC.view.bounds.size.height;
    float width = fromVC.view.bounds.size.width;

    
    if (self.presenting) {
    
        [containerView addSubview:fromVC.view];
        [containerView addSubview:toVC.view];
        

        toVC.view.frame = CGRectMake(0, height, width, height);
        toVC.view.alpha = 0.;
        
        [UIView animateKeyframesWithDuration:1. delay:.3 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
            //
            fromVC.view.frame = CGRectOffset(fromVC.view.frame, 0, fromVC.view.bounds.size.height *(-1));
            toVC.view.frame = CGRectMake(0, 0, width, height);
            //fromVC.view.alpha = 0.;
            toVC.view.alpha = .8;
        } completion:^(BOOL finished) {
            //
            [transitionContext completeTransition:YES];
        }];
    }else{
        
        [containerView addSubview:fromVC.view];
        [containerView addSubview:toVC.view];
        toVC.view.frame = CGRectMake(0, height*(-1), width, height);
        
        [UIView animateWithDuration:1. animations:^{
            fromVC.view.alpha = 1.;
            toVC.view.alpha = 1.;
            fromVC.view.frame = CGRectMake(0, height, width,height);
            toVC.view.frame = CGRectMake(0, 0, width,height);

        } completion:^(BOOL finished) {
            //
            [transitionContext completeTransition:YES];
        }];
    
    }
}


@end
