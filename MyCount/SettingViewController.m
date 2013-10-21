//
//  SettingViewController.m
//  MyCount
//
//  Created by forrest on 13-10-19.
//  Copyright (c) 2013年 Forrest Shi. All rights reserved.
//

#import "SettingViewController.h"
#import "UIColor+iOS7Colors.h"
#import <QuartzCore/QuartzCore.h>
#import "AudioUtility.h"
#import "iRate.h"
#import "Flurry.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    for (UIView *v in self.view.subviews) {
        if ([v isKindOfClass:[UIButton class]] && v.tag > 99) {
            v.layer.cornerRadius = v.bounds.size.width/2;
            v.backgroundColor = [UIColor indexColor:(v.tag -100)];
        }
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UISwipeGestureRecognizer *swipDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipDown)];
    swipDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipDown];
    
    
    BOOL showTip = [[NSUserDefaults standardUserDefaults] boolForKey:@"tipSetting"];
    if (!showTip) {
        UIImageView *tipView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        tipView.backgroundColor = [UIColor blackColor];
        tipView.alpha = .8;
        
        tipView.contentMode = UIViewContentModeCenter | UIViewContentModeScaleAspectFill;
        tipView.image = [UIImage imageNamed:@"swipe_down.png"];
        
        [self.view addSubview:tipView];
        
        double delayInSeconds = 1.5;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [UIView animateWithDuration:.8 animations:^{
                //
                tipView.transform = CGAffineTransformTranslate(tipView.transform, 0, 200);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:.7 animations:^{
                    tipView.alpha = 0.;
                } completion:^(BOOL finished) {
                    [tipView removeFromSuperview];
                }];
            }];
            
        });
        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tipSetting"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    

    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



- (void)viewWillAppear:(BOOL)animated{
    BOOL on = [[NSUserDefaults standardUserDefaults] boolForKey:@"sound"];
    [self.soundSwitch setOn:on];
}

- (void)swipDown{
    [self confirmed:nil];
    [[AudioUtility sharedInstance] playSound:@"down" withType:@"caf"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)confirmed:(id)sender{

    DLog(@"done");
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (IBAction)soundOn:(id)sender{
    UISwitch *s = (UISwitch*)sender;
    [[NSUserDefaults standardUserDefaults] setBool:s.isOn forKey:@"sound"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[AudioUtility sharedInstance] playSound:@"ting" withType:@"wav"];
}
- (IBAction)chooseColor:(id)sender{
    UIButton *b = (UIButton*)sender;
    [[NSUserDefaults standardUserDefaults] setObject: [NSNumber numberWithInt:(b.tag-100)] forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[AudioUtility sharedInstance] playSound:@"c2" withType:@"caf"];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}

- (IBAction)rate:(id)sender{
    
    [Flurry logEvent:@"Rate"];
    
    [[iRate sharedInstance] promptForRating];
}


@end
