//
//  SettingViewController.h
//  MyCount
//
//  Created by forrest on 13-10-19.
//  Copyright (c) 2013年 Forrest Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController

@property (nonatomic,strong) IBOutlet UISwitch *soundSwitch;

- (IBAction)confirmed:(id)sender;
- (IBAction)soundOn:(id)sender;
- (IBAction)chooseColor:(id)sender;

@end
