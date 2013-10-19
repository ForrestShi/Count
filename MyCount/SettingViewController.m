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

}
- (IBAction)chooseColor:(id)sender{
    UIButton *b = (UIButton*)sender;
    [[NSUserDefaults standardUserDefaults] setObject: [NSNumber numberWithInt:(b.tag-100)] forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

@end
