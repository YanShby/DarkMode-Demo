//
//  BackgroundColorsViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "BackgroundColorsViewController.h"

@interface BackgroundColorsViewController ()

@end

@implementation BackgroundColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSArray<NSString *> *)systemColorsNameArray
{
    return @[
             @"systemBackgroundColor",
             @"secondarySystemBackgroundColor",
             @"tertiarySystemBackgroundColor",
             @"systemGroupedBackgroundColor",
             @"secondarySystemGroupedBackgroundColor",
             @"tertiarySystemGroupedBackgroundColor"
             ];
}

- (CGFloat)colorsCellHeight
{
    return 50.f;
}

@end
