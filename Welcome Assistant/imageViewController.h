//
//  imageViewController.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface imageViewController : NSViewController
{
    NSString *imageViewTitle;
    NSString *imageViewImagePath;
}
@property (weak) IBOutlet NSTextField *imageViewTitleControl;
@property (weak) IBOutlet NSImageView *imageViewControl;

- (id)initWithTitle:(NSString *)titleString image:(NSString *)imagePath;

@end
