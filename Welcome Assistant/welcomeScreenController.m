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
        welcomeImage = imagePath;
        [self.welcomeScreenTitle setStringValue:welcomeTitle];
        [self.welcomeScreenBody setStringValue:welcomeBody];
        [self.welcomeScreenImage setStringValue:welcomeImage];
    }
    return self;
}


- (id)init
{
    self = [super init];
    if (self) {
        [self.welcomeScreenTitle setStringValue:@"Title"];
        [self.welcomeScreenBody setStringValue:@"Body"];
        [self.welcomeScreenImage setStringValue:@"/path/to/image.jpg"];
    }
    return self;
}


- (NSString *)description
{
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"Title = %@, Body = %@, Image = %@", welcomeTitle, welcomeBody, welcomeImage];
    return result;
}

@end
