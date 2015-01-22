//
//  webViewController.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


- (id)initWithTitle:(NSString *)titleString url:(NSString *)urlString
{
    self = [super init];
    if (self) {
        webViewTitle = titleString;
        webViewURL = urlString;
    }
    return self;
}


- (id)init
{
    return [self initWithTitle:@"Default"
                     url:NULL];
}


- (NSString *)description
{
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"Title = %@, URL = %@", webViewTitle, webViewURL];
    return result;
}


- (void)loadView
{
    [super loadView];
    [self.webViewTitleControl setStringValue:webViewTitle];
    [self.webViewControl setMainFrameURL:webViewURL];
}

@end
