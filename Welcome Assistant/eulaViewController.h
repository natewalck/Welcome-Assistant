//
//  eulaViewController.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface eulaViewController : NSViewController
{
    NSString *eulaViewTitle;
    NSString *eulaViewBody;
}

@property (weak) IBOutlet NSTextField *eulaViewTitleControl;
@property (weak) IBOutlet NSTextField *eulaViewBodyControl;
@property (weak) IBOutlet NSButton *eulaViewCheckboxControl;

- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString;

@end
