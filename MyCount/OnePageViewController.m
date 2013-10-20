//
//  OnePageViewController.m
//  MyCount
//
//  Created by Shi Lin on 10/14/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "OnePageViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIColor+iOS7Colors.h"
#import "AudioUtility.h"

@interface OnePageViewController ()<UITextFieldDelegate>{
    UITextField *title ;
    UILabel *countLabel;
    UILabel *lbl ;
}

@end

@implementation OnePageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self readCountData];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    float offX = IS_IPHONE_5 ? 40.: 38.;
    float offY = IS_IPHONE_5 ? 40.: 30.;
    
    title = [[UITextField alloc] initWithFrame:CGRectMake(offX, offY, 320 - offX *2,  40.)];
    title.placeholder = @"Click Here ";
    title.textColor = [UIColor systemColor];
    title.center = CGPointMake(self.view.center.x, self.view.center.y - (320 - offX*2)/2 - 40.);
    
    title.font = [UIFont systemFontOfSize:30.];
    title.textAlignment = NSTextAlignmentCenter;
    title.delegate = self;
    [self.view addSubview:title];
    
    lbl = [[UILabel alloc] initWithFrame:CGRectMake(offX, offY + title.bounds.size.height +  IS_IPHONE_5?20.:10., 320 - offX *2 , 320 - offX *2)];
    lbl.backgroundColor = [UIColor systemColor];
    lbl.center = self.view.center;
    lbl.font = [UIFont boldSystemFontOfSize:150.];
    lbl.textColor = [UIColor whiteColor];
    [lbl setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.count]];
    lbl.textAlignment = NSTextAlignmentCenter;
    lbl.layer.cornerRadius = lbl.bounds.size.width/2;
    countLabel = lbl;
    [self.view addSubview:countLabel];

    self.view.backgroundColor =  [UIColor whiteColor];//[self indexColor:self.index%10];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.view addGestureRecognizer:tap];
    
    [self readCountData];
}

- (void)viewWillAppear:(BOOL)animated{
    lbl.backgroundColor = [UIColor systemColor];
    title.textColor = [UIColor systemColor];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [[AudioUtility sharedInstance] playSound:@"Tap" withType:@"caf"];
}


- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)onTap:(UITapGestureRecognizer*)gesture{
    [title resignFirstResponder];
    [[AudioUtility sharedInstance] playSound:@"commit" withType:@"caf"];
    [self saveCountData];
}

- (void)updateUI{
    if ([title.text isEqualToString:@""]) {
        [title becomeFirstResponder];
        self.count = 0;
        return;
    }
    [countLabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)self.count]];
    [self saveCountData];
}

- (void)readCountData{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"key%lu",(unsigned long)self.index]];
    [title setText:[dict objectForKey:@"habit"]];
    
    NSNumber* countNum = [dict objectForKey:@"count"];
    if (!countNum) {
        [countLabel setText:[NSString stringWithFormat:@"0"]];
    }else{
        int countInt = [countNum intValue];
        if (countInt < 0 ) {
            countInt = 0 ;
        }else if (countInt > 99){
            countInt = 99;
        }
        [countLabel setText:[NSString stringWithFormat:@"%d",countInt]];
    }
    
    self.count = [countNum integerValue];

}

- (void)saveCountData{
    if (![title.text isEqualToString:@""] ) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithObjects:@[title.text,[NSNumber numberWithInteger:self.count]] forKeys:@[@"habit",@"count"]];
        [[NSUserDefaults standardUserDefaults] setObject:dict forKey:[NSString stringWithFormat:@"key%lu",(unsigned long)self.index]];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
