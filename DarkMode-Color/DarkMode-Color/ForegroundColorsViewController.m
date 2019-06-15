//
//  ForegroundColorsViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "ForegroundColorsViewController.h"

@interface ForegroundColorsViewController ()

@end

@implementation ForegroundColorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray<NSString *> *)systemColorsNameArray
{
    return @[
             @"labelColor",
             @"secondaryLabelColor",
             @"tertiaryLabelColor",
             @"quaternaryLabelColor",
             @"linkColor",
             @"placeholderTextColor",
             @"separatorColor",
             @"opaqueSeparatorColor"
             ];
}

- (CGFloat)colorsCellHeight
{
    return 50.f;
}
@end
