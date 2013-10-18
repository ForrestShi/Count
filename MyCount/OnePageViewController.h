//
//  OnePageViewController.h
//  MyCount
//
//  Created by Shi Lin on 10/14/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnePageViewController : UIViewController

@property (nonatomic,assign) NSUInteger index;

@property (nonatomic,assign) NSUInteger count;
@property (nonatomic,strong) NSString* topic;

- (void)updateUI;
- (void)readCountData;

@end
