//
//  ViewController.m
//  MyCount
//
//  Created by Shi Lin on 10/12/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+iOS7Colors.h"
#import "CustomizedSettingTransition.h"
#import "AudioUtility.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    self.addBtn.tintColor = [UIColor iOS7orangeColor];
    self.reduceBtn.tintColor = [UIColor iOS7orangeColor];
    
    UIImageView *tipView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    tipView.backgroundColor = [UIColor blackColor];
    tipView.alpha = .5;
    
    tipView.contentMode = UIViewContentModeCenter | UIViewContentModeScaleAspectFill;
    tipView.image = [UIImage imageNamed:@"swipup.png"];
    
    [self.view addSubview:tipView];
    
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [UIView animateWithDuration:.7 animations:^{
            tipView.alpha = 0.;
        } completion:^(BOOL finished) {
            [tipView removeFromSuperview];
        }];
    });
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewWillAppear:(BOOL)animated{
    self.addBtn.tintColor = [UIColor systemColor];
    self.reduceBtn.tintColor = [UIColor systemColor];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)add:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AddNft" object:nil];
}

- (IBAction)reduce:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ReduceNft" object:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showSetting"]) {
        UIViewController *dvc = segue.destinationViewController;
        dvc.transitioningDelegate = self;
        
        [[AudioUtility sharedInstance] playSound:@"up" withType:@"caf"];

    }
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{

    CustomizedSettingTransition *t = [[CustomizedSettingTransition alloc] init];
    t.presenting = YES;
    return t;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    CustomizedSettingTransition *t = [[CustomizedSettingTransition alloc] init];
    return t;
}

@end
