//
//  TwitterDemoAppDelegate.m
//  TwitterDemo
//
//  Created by Piet Brauer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitterDemoAppDelegate.h"
#import <Twitter/Twitter.h>

@implementation TwitterDemoAppDelegate

@synthesize window = _window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    viewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
    [self.window addSubview:viewController.view];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self action:@selector(postToTwitter:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Twitter Me" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.window addSubview:button];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)postToTwitter:(id)sender{
    TWTweetComposeViewController *twitter = [[TWTweetComposeViewController alloc] init];
    [twitter setInitialText:@"Really Simple to share in iOS 5"];
    [twitter addImage:[UIImage imageNamed:@"Icon.png"]];
    [twitter addURL:[NSURL URLWithString:[NSString stringWithString:@"http://blog.nerdishbynature.com/"]]];
    [viewController presentViewController:twitter animated:YES completion:nil];
    twitter.completionHandler = ^(TWTweetComposeViewControllerResult res) {
        if (res == TWTweetComposeViewControllerResultDone) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Wohoo!" message:@"We did it...!" delegate:self cancelButtonTitle:@"Go Away" otherButtonTitles:nil];
            [alertView show];
        } else if (res == TWTweetComposeViewControllerResultCancelled) {
            UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Damn it!" message:@"Something went wrong" delegate:self cancelButtonTitle:@"Go Away" otherButtonTitles:nil];
            [alertView show];
        }
        [viewController dismissModalViewControllerAnimated:YES];
    };
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
