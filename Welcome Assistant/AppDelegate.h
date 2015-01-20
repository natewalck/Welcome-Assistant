//
//  AppDelegate.h
//  Welcome Assistant
//
//  Created by Nate Walck on 1/19/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    NSArray *pageList;
    NSDictionary *prefPageList;
    NSArray *welcomePrefs;
    
    NSViewController *theWelcomeView;
    NSViewController *nextPageController;
    NSViewController *previousPageController;
    NSViewController *currentViewController;
    
    NSWorkspace *currentWorkspace;
    
    NSUserDefaults *standardUserDefaults;
    
    NSInteger *firstPage;
    NSInteger *lastPage;
    NSInteger *currentPage;
    NSInteger *nextPage;
    NSInteger *previousPage;
    
    BOOL *endOfAssistant;
}

@property (weak) IBOutlet NSWindow *mainWindowControl;
@property (weak) IBOutlet NSButton *continueButtonControl;
@property (weak) IBOutlet NSButton *backButtonControl;

@property (weak) IBOutlet NSView *myCustomView;


- (IBAction)continueButton:(id)sender;
- (IBAction)backButton:(id)sender;

- (void)loadPreferences;
- (id)setupWelcomeView:(NSArray *)pageToSetup;
- (NSViewController *)changeViewController:(NSViewController *)viewName;


@end