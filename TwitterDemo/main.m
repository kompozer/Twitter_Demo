//
//  main.m
//  TwitterDemo
//
//  Created by Piet Brauer on 16.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TwitterDemoAppDelegate.h"

int main(int argc, char *argv[])
{
    int retVal = 0;
    @autoreleasepool {
        retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([TwitterDemoAppDelegate class]));
    }
    return retVal;
}
