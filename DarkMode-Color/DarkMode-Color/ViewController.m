//
//  ViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/11.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "ViewController.h"
#import "SuperColorsViewController.h"
#import "SystemColorsViewController.h"
#import "ForegroundColorsViewController.h"
#import "BackgroundColorsViewController.h"
#import "FillColorsViewController.h"
#import "OtherColorsViewController.h"
#import "DarkColorViewController.h"
#import "ColorH5ViewController.h"

@interface ColorTableViewCell : UITableViewCell
- (instancetype)initWithreuseIdentifier:(NSString *)reuseIdentifier;
@end

@implementation ColorTableViewCell

- (instancetype)initWithreuseIdentifier:(NSString *)reuseIdentifier;
{
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}

@end

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, copy) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    self.title = @"iOS 13 - Color Demo";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    // 注册cell
    [self.tableView registerClass:ColorTableViewCell.class forCellReuseIdentifier:@"ColorCell"];
}

- (NSArray *)dataArray
{
    return @[
             @"System colors",
             @"Foreground colors",
             @"Background colors",
             @"Fill colors",
             @"Other colors",
             @"Images ViewController",
             @"Web Color ViewController"
             ];
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorTableViewCell *cell = [[ColorTableViewCell alloc] initWithreuseIdentifier:@"ColorCell"];
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"SubTitle";
    cell.textLabel.textColor = UIColor.labelColor;
    cell.detailTextLabel.textColor = UIColor.tertiaryLabelColor;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperColorsViewController *viewController = nil;
    if (indexPath.row == 0)
    {
        viewController = [[SystemColorsViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    else if (indexPath.row == 1)
    {
        viewController = [[ForegroundColorsViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    else if (indexPath.row == 2)
    {
        viewController = [[BackgroundColorsViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    else if (indexPath.row == 3)
    {
        viewController = [[FillColorsViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    else if (indexPath.row == 4)
    {
        viewController = [[OtherColorsViewController alloc] initWithStyle:UITableViewStylePlain];
    }
    else  if (indexPath.row == 5)
    {
        viewController = [DarkColorViewController new];
    }
    else if (indexPath.row == 6)
    {
        viewController = [ColorH5ViewController new];
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
