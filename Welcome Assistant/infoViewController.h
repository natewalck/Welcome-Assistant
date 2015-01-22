//
//  infoViewController.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface infoViewController : NSViewController
{
    NSString *infoViewTitle;
    NSString *infoViewBody;
}

@property (weak) IBOutlet NSTextField *infoViewTitleControl;
@property (weak) IBOutlet NSTextField *infoViewBodyControl;

- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString;

@end
