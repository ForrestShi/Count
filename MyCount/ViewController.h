//
//  ViewController.h
//  MyCount
//
//  Created by Shi Lin on 10/12/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) IBOutlet UIButton *addBtn;
@property (nonatomic,strong) IBOutlet UIButton *reduceBtn;

- (IBAction)add:(id)sender;
- (IBAction)reduce:(id)sender;

@end
