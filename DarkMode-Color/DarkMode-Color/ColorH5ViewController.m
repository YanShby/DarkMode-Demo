//
//  ColorH5ViewController.m
//  DarkMode-Color
//
//  Created by Shen,Yan(BBTD) on 2019/6/15.
//  Copyright © 2019 申岩. All rights reserved.
//

#import "ColorH5ViewController.h"
#import <WebKit/WebKit.h>

@interface ColorH5ViewController ()
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation ColorH5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];

    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"DarkMode" ofType:@"html"]];
    [self.webView loadFileURL:url allowingReadAccessToURL:url];
}

@end
