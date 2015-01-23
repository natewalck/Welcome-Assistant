//
//  AppDelegate.m
//  Welcome Assistant
//
//  Created by Nate Walck on 1/19/15.
//  Copyright (c) 2015 OS X DevOps. All rights reserved.
//

#import "AppDelegate.h"
#import "welcomeScreenController.h"
#import "infoViewController.h"
#import "webViewController.h"
#import "imageViewController.h"
#import "eulaViewController.h"

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
    _theWelcomeView = [self setupWelcomeView:_welcomePrefs];
    [self changeViewController:_theWelcomeView];
    _pageList = [[NSMutableArray alloc] init];
    [_pageList addObject:_theWelcomeView];
    NSArray *newPages = [[NSArray alloc] init];
    newPages = [self setupAllPages: _prefPageList];
    [_pageList addObjectsFromArray:newPages];
    for (id page in _pageList){
        NSLog(@"%@", page);
    }
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
        _currentWorkspace = [NSWorkspace sharedWorkspace];
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
    _prefPageList = [userDefaults objectForKey:@"AssistantPages"];
    _welcomePrefs = [userDefaults objectForKey:@"WelcomePage"];
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
    NSArray *allSubViews = [[self myCustomView] subviews];
    for (id subView in allSubViews) {
        [subView removeFromSuperview];
    }
    _currentViewController = viewName;
    [[self myCustomView] addSubview:[viewName view]];
    [[viewName view] setFrame:[[self myCustomView] bounds]];
    return _currentViewController;
}

-(NSArray *)setupAllPages:(NSDictionary *)pagesToSetup
{
    NSMutableArray *newPages = [[NSMutableArray alloc] init];
    for (id page in pagesToSetup) {
        NSString *pageType = [page objectForKey:@"PageType"];

        // Issue correct setupController command and add page to pageList array
        if([pageType isEqualToString:@"info"]){
//            NSLog(@"Info Page!");
            infoViewController *newView = [[infoViewController alloc] initWithTitle:[page objectForKey:@"Title"]
                                                                               body:[page objectForKey:@"Body"]];
            [newPages addObject:newView];
        }
        else if([pageType isEqualToString:@"weburl"]){
//            NSLog(@"URL Page!");
            webViewController *newView = [[webViewController alloc] initWithTitle:[page objectForKey:@"Title"]
                                                                               url:[page objectForKey:@"URL"]];
            [newPages addObject:newView];
        }
        else if([pageType isEqualToString:@"image"]){
//            NSLog(@"Image Page!");
            imageViewController *newView = [[imageViewController alloc] initWithTitle:[page objectForKey:@"Title"]
                                                                                image:[page objectForKey:@"Body"]];
            [newPages addObject:newView];
        }
    }
//    for (id page in newPages) {
//        NSLog(@"%@", page);
//    }
    NSLog(@"setupAllPages complete!");
    return newPages;
}


@end