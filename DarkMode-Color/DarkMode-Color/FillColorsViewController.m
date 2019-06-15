//
//  FillColorsViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "FillColorsViewController.h"

@interface FillColorsViewController ()

@end

@implementation FillColorsViewController

- (NSArray<NSString *> *)systemColorsNameArray
{
    return @[
             @"systemFillColor",
             @"secondarySystemFillColor",
             @"tertiarySystemFillColor",
             @"quaternarySystemFillColor"
             ];
    
}

- (CGFloat)colorsCellHeight
{
    return 50.f;
}
@end
