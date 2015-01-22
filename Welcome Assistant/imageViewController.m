//
//  imageViewController.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "imageViewController.h"

@interface imageViewController ()

@end

@implementation imageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (id)initWithTitle:(NSString *)titleString image:(NSString *)imagePath
{
    self = [super init];
    if (self) {
        imageViewTitle = titleString;
        imageViewImagePath = imagePath;
    }
    return self;
}

- (id)init
{
    return [self initWithTitle:@"Default"
                         image:NULL];
}

- (NSString *)description
{
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"Title = %@, ImagePath= %@", imageViewTitle, imageViewImagePath];
    return result;
}


// Add check to make sure welcomeScreenImage is valid, otherwise don't try to load it.
- (void)loadView
{
    [super loadView];
    NSImage *imageViewImage = [[NSImage alloc] initWithContentsOfFile:imageViewImagePath];
    [self.imageViewTitleControl setStringValue:imageViewTitle];
    [self.imageViewControl setImage:imageViewImage];
}

@end
