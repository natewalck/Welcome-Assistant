//
//  eulaViewController.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/21/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "eulaViewController.h"

@interface eulaViewController ()

@end

@implementation eulaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (id)initWithTitle:(NSString *)titleString body:(NSString *)bodyString
{
    self = [super init];
    if (self) {
        eulaViewTitle = titleString;
        eulaViewBody = bodyString;
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
    result = [[NSString alloc] initWithFormat:@"Title = %@, Body = %@", eulaViewTitle, eulaViewBody];
    return result;
}


- (void)loadView
{
    [super loadView];
    [self.eulaViewTitleControl setStringValue:eulaViewTitle];
    [self.eulaViewBodyControl setStringValue:eulaViewBody];
}

@end
