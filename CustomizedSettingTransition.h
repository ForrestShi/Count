//
//  CustomizedSettingTransition.h
//  MyCount
//
//  Created by forrest on 13-10-19.
//  Copyright (c) 2013年 Forrest Shi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomizedSettingTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,assign) BOOL presenting;
@end
