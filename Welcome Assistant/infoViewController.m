//
//  infoViewController.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "infoViewController.h"

@interface infoViewController ()

@end

@implementation infoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString
{
    self = [super init];
    if (self) {
        infoViewTitle = titleString;
        infoViewBody = bodyString;
    }
    return self;
}


- (id)init
{
    return [self initWithTitle:@"Default"
                           body:NULL];
}


- (NSString *)description
{
    NSString *result;
    result = [[NSString alloc] initWithFormat:@"Title = %@, Body = %@", infoViewTitle, infoViewBody];
    return result;
}


- (void)loadView
{
    [super loadView];
    [self.infoViewTitleControl setStringValue:infoViewTitle];
    [self.infoViewBodyControl setStringValue:infoViewBody];
}

@end
