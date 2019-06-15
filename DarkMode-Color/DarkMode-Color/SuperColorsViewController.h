//
//  SuperColorsViewController.h
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperColorsCell : UITableViewCell
- (void)bindColorWithName:(NSString *)name;
@end

@interface SuperColorsViewController : UITableViewController
- (NSArray<NSString *> *)systemColorsNameArray; // override
- (CGFloat)colorsCellHeight;
@end

