//
//  ViewController.m
//  MyCount
//
//  Created by Shi Lin on 10/12/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+iOS7Colors.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 
    self.addBtn.tintColor = [UIColor blackColor];
    self.reduceBtn.tintColor = [UIColor blackColor];
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

@end
