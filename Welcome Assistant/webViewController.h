//
//  webViewController.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface webViewController : NSViewController
{
    NSString *webViewURL;
    NSString *webViewTitle;
}
@property (weak) IBOutlet NSTextField *webViewTitleControl;
@property (weak) IBOutlet WebView *webViewControl;

- (id)initWithTitle:(NSString *)titleString url:(NSString *)urlString;

@end