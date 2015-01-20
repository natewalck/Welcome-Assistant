//
//  AppDelegate.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/19/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "AppDelegate.h"
#import "welcomeScreenController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Load all application UI related things here otherwise they don't work
    [NSApp activateIgnoringOtherApps:true];
    NSSize windowSize = _mainWindowControl.frame.size;
    [_mainWindowControl setMinSize:windowSize];
    [_mainWindowControl setMaxSize:windowSize];
    theWelcomeView = [self setupWelcomeView:welcomePrefs];
    [self changeViewController:theWelcomeView];
    NSLog(@"%@", theWelcomeView);
    [pageList arrayByAddingObject:[self setupWelcomeView:welcomePrefs]];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (id)init
{
    self = [super init];
    if (self) {
        // Load non UI things here
        NSLog(@"Application init!");
        [self loadPreferences];
        currentWorkspace = [NSWorkspace sharedWorkspace];
    }
    return self;
}


- (void)awakeFromNib {
    _backButtonControl.enabled = false;
}

- (IBAction)continueButton:(id)sender {
    NSLog(@"Continue Button Pressed");
}

- (IBAction)backButton:(id)sender {
    NSLog(@"Back Button Pressed");
}


- (void)loadPreferences {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults synchronize];
    NSString *defaultPrefsFile = [[NSBundle mainBundle] pathForResource:@"defaultPrefs" ofType:@"plist"];
    NSDictionary *defaultPreferences = [NSDictionary dictionaryWithContentsOfFile:defaultPrefsFile];
    [userDefaults synchronize];
    [userDefaults registerDefaults:defaultPreferences];
    prefPageList = [userDefaults objectForKey:@"AssistantPages"];
    welcomePrefs= [userDefaults objectForKey:@"WelcomePage"];
}

- (id)setupWelcomeView:(NSArray *)pageToSetup {
    NSDictionary *item = [pageToSetup objectAtIndex:0];
    NSString *titleValue = [item objectForKey:@"Title"];
    NSString *imagePath = [item objectForKey:@"Image"];
    NSString *bodyValue = [item objectForKey:@"Body"];
    welcomeScreenController *returnView = [[welcomeScreenController alloc] initWithTitle:titleValue
                                                                                    body:bodyValue
                                                                                   image:imagePath];
    return returnView;
}

-(NSViewController *)changeViewController:(NSViewController *)viewName
{
    currentViewController = viewName;
    [[self myCustomView] addSubview:[viewName view]];
    return currentViewController;
}

@end