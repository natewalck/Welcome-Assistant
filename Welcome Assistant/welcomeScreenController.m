//
//  welcomeScreenController.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/19/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "welcomeScreenController.h"

@interface welcomeScreenController ()

@end

@implementation welcomeScreenController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}


- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString image:(NSString *)imagePath
{
    self = [super init];
    if (self) {
        welcomeTitle = titleString;
        welcomeBody = bodyString;
        welcomeImagePath = imagePath;
    }
    return self;
}


- (id)init
{
    return [self initWithTitle:@"Default"
                       body:@"Default"
                         image:NULL];
}


- (NSString *)description
{
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"Title = %@, Body = %@, Image = %@", welcomeTitle, welcomeBody, welcomeImagePath];
    return result;
}


// Add check to make sure welcomeScreenImage is valid, otherwise don't try to load it.
- (void)loadView
{
    [super loadView];
    NSImage *welcomeImage = [[NSImage alloc] initWithContentsOfFile:welcomeImagePath];
    [self.welcomeScreenTitle setStringValue:welcomeTitle];
    [self.welcomeScreenBody setStringValue:welcomeBody];
    [self.welcomeScreenImage setImage:welcomeImage];
}


@end