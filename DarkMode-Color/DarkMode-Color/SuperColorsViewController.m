//
//  SuperColorsViewController.m
//  DarkMode-Color
//
//  Created by 申岩 on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "SuperColorsViewController.h"

#define SystemColorsCellHeight  35.f

@interface SuperColorsCell ()
@property (nonatomic, strong) UIView *lightColorView;
@property (nonatomic, strong) UIView *darkColorView;
@property (nonatomic, strong) UILabel *nameLabel;
@end

@implementation SuperColorsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(CGFloat)height
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupSubviewsWithHeight:height];
    }
    return self;
}

- (void)setupSubviewsWithHeight:(CGFloat)height;
{
    // 如果父视图指定了展示某个模式, 那个下面的没有设置过该属性的子视图会继承父视图来显示
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width / 2;
    self.lightColorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, height)];
    // 指定只显示某个模式
    self.lightColorView.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    [self.contentView addSubview:self.lightColorView];
    
    self.darkColorView = [[UIView alloc] initWithFrame:CGRectMake(self.lightColorView.frame.size.width, 0,
                                                                  viewWidth, height)];
    // 指定只显示某个模式
    self.darkColorView.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
    [self.contentView addSubview:self.darkColorView];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, viewWidth, height)];
    self.nameLabel.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.nameLabel];
}

- (void)bindColorWithName:(NSString *)name
{
    self.nameLabel.text = name;
    [self.nameLabel sizeToFit];
    self.nameLabel.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, self.contentView.bounds.size.height / 2);
    
    self.lightColorView.backgroundColor = [self colorWithName:name];
    self.darkColorView.backgroundColor = [self colorWithName:name];
}

- (UIColor *)colorWithName:(NSString *)name
{
    return (UIColor *)[UIColor performSelector:NSSelectorFromString(name)];
}

@end


@interface SuperColorsViewController ()

@end

@implementation SuperColorsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (NSArray<NSString *> *)systemColorsNameArray
{
    // override;
    return nil;
}

- (CGFloat)colorsCellHeight
{
    // override;
    return SystemColorsCellHeight;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.systemColorsNameArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self colorsCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SuperColorsCell *cell = [[SuperColorsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SuperColorsCell" height:[self colorsCellHeight]];
    
    [cell bindColorWithName:[[self systemColorsNameArray] objectAtIndex:indexPath.row]];
    
    return cell;
}
@end
