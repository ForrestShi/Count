//
//  MyPageViewController.m
//  MyCount
//
//  Created by Shi Lin on 10/14/13.
//  Copyright (c) 2013 Forrest Shi. All rights reserved.
//

#import "MyPageViewController.h"
#import "OnePageViewController.h"
#import "AudioUtility.h"


@interface MyPageViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>{
}

@end

@implementation MyPageViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    OnePageViewController *ovc = [OnePageViewController new];
    ovc.index = 0;
    [self setViewControllers:@[ovc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    self.view.userInteractionEnabled = YES;
    self.dataSource = self;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleCount:) name:@"AddNft" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleCount:) name:@"ReduceNft" object:nil];
}

- (void)handleCount:(NSNotification*)nft{
    OnePageViewController* currentPVC = [self.viewControllers objectAtIndex:0];
    if (currentPVC) {
        int countNum = (int)currentPVC.count;
        if ([nft.name isEqualToString:@"AddNft"]) {
            DLog(@"add");
            countNum++;
            [[AudioUtility sharedInstance] playSound:@"count" withType:@"wav"];

        }else if ([nft.name isEqualToString:@"ReduceNft"]) {
            DLog(@"reduce");
            countNum--;
            [[AudioUtility sharedInstance] playSound:@"reduce" withType:@"wav"];

        }
        
        if (countNum < 0 ) {
            countNum = 0;
        }
        
        currentPVC.count = countNum;
        [currentPVC updateUI];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (OnePageViewController*)newPage:(NSUInteger)idx{
    OnePageViewController *pvc = [[OnePageViewController alloc] initWithNibName:nil bundle:nil];
    [pvc readCountData];
    pvc.index = idx;
    return pvc;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{

    NSUInteger index = ((OnePageViewController*)viewController).index;
    if (index == 0) {
        return nil;
    }
    index--;
    [[AudioUtility sharedInstance] playSound:@"left" withType:@"caf"];
    return [self newPage:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = ((OnePageViewController*)viewController).index;
    if (index == 7) {
        return nil;
    }
    index++;
    [[AudioUtility sharedInstance] playSound:@"right" withType:@"caf"];
    return [self newPage:index];
}
@end
