//
//  welcomeScreenController.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/19/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface welcomeScreenController : NSViewController
{
    NSString *welcomeTitle;
    NSString *welcomeBody;
    NSString *welcomeImagePath;
}

@property (weak) IBOutlet NSTextField *welcomeScreenTitle;
@property (weak) IBOutlet NSTextField *welcomeScreenBody;
@property (weak) IBOutlet NSImageView *welcomeScreenImage;

- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString image:(NSString *)imagePath;

@end
