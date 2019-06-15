//
//  DarkColorViewController.m
//  DarkMode-Color
//
//  Created by Shen,Yan(BBTD) on 2019/6/12.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "DarkColorViewController.h"

@interface UIColor (CustomDynamicColor)
@property (class, nonatomic, readonly) UIColor *customDynamicColor;
@end

@implementation UIColor (CustomDynamicColor)
+ (UIColor *)customDynamicColor
{
    return [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)
        {
            return UIColor.redColor;
        }
        else
        {
            return UIColor.greenColor;
        }
    }];
}
@end

@interface ESView : UIView
@end

@implementation ESView

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    // UIKit 把UITraitCollection.currentTraitCollection设置给该view的traitCollection
    [UIColor.systemBackgroundColor setFill];
    UIRectFill(rect);
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
//    NSLog(@"- traitCollectionDidChange\n");
    
    // 设置 layer 的 border 颜色
    CALayer *layer = [CALayer new];
    
    UITraitCollection *traitCollection = self.traitCollection;
    
    // option 1 -- iOS 8
    UIColor *resolvedColor = [UIColor.customDynamicColor resolvedColorWithTraitCollection:traitCollection];
    layer.borderColor = resolvedColor.CGColor;
    
    // option 2 -- iOS 13
    [traitCollection performAsCurrentTraitCollection:^{
        layer.borderColor = resolvedColor.CGColor;
    }];
    
    // option 3 -- iOS 13
    UITraitCollection *savedTraitCollection = [UITraitCollection currentTraitCollection];
    
    [UITraitCollection setCurrentTraitCollection:traitCollection];
    layer.borderColor = UIColor.labelColor.CGColor;
    
    [UITraitCollection setCurrentTraitCollection:savedTraitCollection];
    
}

- (void)tintColorDidChange
{
    [super tintColorDidChange];
//    NSLog(@"- tintColorDidChange\n");
}
@end

@interface ESLayer : CALayer
@end

@implementation ESLayer

- (void)drawInContext:(CGContextRef)ctx
{
    [super drawInContext:ctx];
    NSLog(@"drawInContext");
}

@end

@interface ESImageView : UIImageView
@end

@implementation ESImageView

- (void)setImage:(UIImage *)image
{
    [super setImage:image];
    NSLog(@"imageView - setImage");
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSLog(@"imageView - drawRect");
}


- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
//    NSLog(@"imageView - traitCollectionDidChange : %@",self.image);
//    if ([UITraitCollection.currentTraitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection])
//    {
//        CGSize size = self.bounds.size;
//        
//        UIImage *lightImage = [[UIImage imageNamed:@"StarLord"].imageAsset imageWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]];
//        UIImage *darkImage = [[UIImage imageNamed:@"StarLord"].imageAsset imageWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]];
//        
//        UIGraphicsImageRenderer *render = [[UIGraphicsImageRenderer alloc] initWithSize:size];
//        
//        UIImage *image = [render imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
//            
//            if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark)
//            {
//                CGContextDrawImage(rendererContext.CGContext, self.bounds, darkImage.CGImage);
//            }
//            else
//            {
//                CGContextDrawImage(rendererContext.CGContext, self.bounds, lightImage.CGImage);
//            }
//        }];
//        
//        self.image = image;
//    }
}

@end

@interface ESImage : UIImage
+ (instancetype)esImageNamed:(NSString *)named;
@end

@implementation ESImage

+ (instancetype)esImageNamed:(NSString *)named
{
    return [self imageNamed:named];
}

- (UIImage *)imageWithConfiguration:(UIImageConfiguration *)configuration
{
    NSLog(@"imageWithConfiguration:%@",configuration);
    return [super imageWithConfiguration:configuration];
}

- (void)drawInRect:(CGRect)rect
{
    [super drawInRect:rect];
    NSLog(@"Image - drawInRect");
}

- (void)drawAtPoint:(CGPoint)point
{
    [super drawAtPoint:point];
    NSLog(@"Image - drawAtPoint");
}

- (void)drawAtPoint:(CGPoint)point blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
    [super drawAtPoint:point
            blendMode:blendMode alpha:alpha];
    NSLog(@"Image - drawAtPoint:");
}

- (void)drawInRect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha
{
    [super drawInRect:rect
            blendMode:blendMode alpha:alpha];
    NSLog(@"Image - drawInRect:");
}

- (void)drawAsPatternInRect:(CGRect)rect
{
    [super drawAsPatternInRect:rect];
    NSLog(@"Image - drawAsPatternInRect");
}

- (UITraitCollection *)traitCollection
{
    NSLog(@"traitCollection");
    return [UITraitCollection currentTraitCollection];
}

@end

@interface DarkColorViewController ()
@property (nonatomic, strong) ESView *esView;
@property (nonatomic, strong) ESImageView *imageView;
@end

@implementation DarkColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.esView = [[ESView alloc] initWithFrame:self.view.bounds];
    self.esView.backgroundColor = UIColor.systemBackgroundColor;
    [self.view addSubview:self.esView];
    
    NSLog(@"self.esView.traitCollection : %@",self.esView.traitCollection);
    
    NSLog(@"self.systemRedColor-light:%@", [UIColor.systemRedColor resolvedColorWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]]);
    NSLog(@"self.systemRedColor-dark:%@", [UIColor.systemRedColor resolvedColorWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]]);
    
    UIImage *image = [UIImage imageNamed:@"StarLord"];
    UIImage *lightImage = [[UIImage imageNamed:@"StarLord"].imageAsset imageWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleLight]];
    UIImage *darkImage = [[UIImage imageNamed:@"StarLord"].imageAsset imageWithTraitCollection:[UITraitCollection traitCollectionWithUserInterfaceStyle:UIUserInterfaceStyleDark]];
    self.imageView = [[ESImageView alloc] initWithFrame:CGRectMake(10, 200, 3840 / 10.f, 2160 / 10.f)];
    self.imageView.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    [self.imageView setImage:lightImage];
    [self.view addSubview:self.imageView];
    
    ESImageView *imageView2 = [[ESImageView alloc] initWithFrame:CGRectMake(10, 500, 3840 / 10.f, 2160 / 10.f)];
    [imageView2 setImage:darkImage];
    [self.view addSubview:imageView2];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
    [super viewWillLayoutSubviews];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches
              withEvent:event];
    
    self.esView.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection
{
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (@available(iOS 13, *))
    {
        // 注意, 当app的界面元素发生变化时, 包括转屏等操作都会回调该方法.
        // 所以需要使用ColorAppearance方法进行比较之后确实是主题变化再进行操作.
        if ([UITraitCollection.currentTraitCollection
             hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection])
        {
            // 对比主题改变, 然后做一些操作...
        }
    }
}

- (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController
{
    return [UITraitCollection traitCollectionWithUserInterfaceLevel:UIUserInterfaceLevelElevated];
}

@end
