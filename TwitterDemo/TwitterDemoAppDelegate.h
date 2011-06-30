//
//  TwitterDemoAppDelegate.h
//  TwitterDemo
//
//  Created by Piet Brauer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface TwitterDemoAppDelegate : UIResponder <UIApplicationDelegate>{
    ViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) ViewController *viewController;

@end
