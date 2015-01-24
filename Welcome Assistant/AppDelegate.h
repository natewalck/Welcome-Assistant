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
    NSMutableArray *_pageList;
    NSDictionary *_prefPageList;
    NSArray *_welcomePrefs;
    
    NSViewController *_theWelcomeView;
    NSViewController *_nextPageController;
    NSViewController *_previousPageController;
    NSViewController *_currentViewController;
    
    NSWorkspace *_currentWorkspace;
    
    NSUserDefaults *_standardUserDefaults;
    
    NSInteger _firstPage;
    NSInteger _lastPage;
    NSInteger _currentPage;
    NSInteger _nextPage;
    NSInteger _previousPage;
    
    BOOL *_endOfAssistant;
}

@property (weak) IBOutlet NSWindow *mainWindowControl;
@property (weak) IBOutlet NSButton *continueButtonControl;
@property (weak) IBOutlet NSButton *backButtonControl;

@property (weak) IBOutlet NSView *myCustomView;


- (IBAction)continueButton:(id)sender;
- (IBAction)backButton:(id)sender;

- (void)loadPreferences;
- (NSViewController *)setupWelcomeView:(NSArray *)pageToSetup;
- (void)changeViewController:(NSViewController *)viewName;
- (NSArray *)setupAllPages:(NSDictionary *)pagesToSetup;
- (NSViewController *)pageController:(NSString *)direction;

@end