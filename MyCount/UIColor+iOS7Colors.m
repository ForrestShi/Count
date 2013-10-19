//
//  UIColor+iOS7Colors.m
//  iOS7Colors
//
//  Created by claaslange on 23.08.13.
//
//

#import "UIColor+iOS7Colors.h"

@implementation UIColor (iOS7Colors)

+ (instancetype)iOS7redColor;
{
    return [UIColor colorWithRed:1.0f green:0.22f blue:0.22f alpha:1.0f];
}
+ (instancetype)iOS7orangeColor;
{
    return [UIColor colorWithRed:1.0f green:0.58f blue:0.21f alpha:1.0f];
}
+ (instancetype)iOS7yellowColor;
{
    return [UIColor colorWithRed:1.0f green:0.79f blue:0.28f alpha:1.0f];
}

+ (instancetype)iOS7greenColor;
{
    return [UIColor colorWithRed:0.27f green:0.85f blue:0.46f alpha:1.0f];
}

+ (instancetype)iOS7lightBlueColor;
{
    return [UIColor colorWithRed:0.18f green:0.67f blue:0.84f alpha:1.0f];
}

+ (instancetype)iOS7darkBlueColor;
{
    return [UIColor colorWithRed:0.0f green:0.49f blue:0.96f alpha:1.0f];
}

+ (instancetype)iOS7purpleColor;
{
    return [UIColor colorWithRed:0.35f green:0.35f blue:0.81f alpha:1.0f];
}

+ (instancetype)iOS7pinkColor;
{
    return [UIColor colorWithRed:1.0f green:0.17f blue:0.34f alpha:1.0f];
}

+ (instancetype)iOS7darkGrayColor;
{
    return [UIColor colorWithRed:0.56f green:0.56f blue:0.58f alpha:1.0f];
}

+ (instancetype)iOS7lightGrayColor;
{
    return [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0f];
}

/*
 + (instancetype)iOS7redColor;
 + (instancetype)iOS7orangeColor;
 + (instancetype)iOS7yellowColor;
 + (instancetype)iOS7greenColor;
 + (instancetype)iOS7lightBlueColor;
 + (instancetype)iOS7darkBlueColor;
 + (instancetype)iOS7purpleColor;
 + (instancetype)iOS7pinkColor;
 + (instancetype)iOS7darkGrayColor;
 + (instancetype)iOS7lightGrayColor;
 */
+ (UIColor*)indexColor:(NSInteger)idx{
    
    switch (idx) {
        case 0:
            return [UIColor iOS7redColor];
            break;
        case 1:
            return [UIColor iOS7orangeColor];
            break;
        case 2:
            return [UIColor iOS7yellowColor];
            break;
        case 3:
            return [UIColor iOS7greenColor];
            break;
        case 4:
            return [UIColor iOS7lightBlueColor];
            break;
        case 5:
            return [UIColor iOS7darkBlueColor];
            break;
        case 6:
            return [UIColor iOS7purpleColor];
            break;
        case 7:
            return [UIColor iOS7pinkColor];
            break;
        case 8:
            return [UIColor iOS7darkGrayColor];
            break;
        case 9:
            return [UIColor iOS7lightGrayColor];
            break;
        default:
            return [UIColor whiteColor];
            break;
    }
    
}

@end
