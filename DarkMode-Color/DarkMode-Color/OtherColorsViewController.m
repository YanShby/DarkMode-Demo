//
//  OtherColorsViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "OtherColorsViewController.h"

@interface OtherColorsViewController ()

@end

@implementation OtherColorsViewController

- (NSArray<NSString *> *)systemColorsNameArray
{
    return @[
             @"lightTextColor",
             @"darkTextColor",
             @"groupTableViewBackgroundColor",
             @"viewFlipsideBackgroundColor",
             @"scrollViewTexturedBackgroundColor",
             @"underPageBackgroundColor"
             ];
}

- (CGFloat)colorsCellHeight
{
    return 50.f;
}
@end
