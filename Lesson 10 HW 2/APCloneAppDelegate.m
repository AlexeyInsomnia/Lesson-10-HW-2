//
//  APCloneAppDelegate.m
//  Lesson 10 HW 2
//
//  Created by Alex on 18.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APCloneAppDelegate.h"
#import "AppDelegate.h"


@implementation APCloneAppDelegate

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self
               selector:@selector(willResignActiveNotification:)
                   name:UIApplicationWillResignActiveNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(didEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        
        [nc addObserver:self
               selector:@selector(willEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(didBecomeActiveNotification:)
                   name:UIApplicationDidBecomeActiveNotification
                 object: nil];
        
        
        [nc addObserver:self
               selector:@selector(willTerminateNotification:)
                   name:UIApplicationWillTerminateNotification
                 object:nil];
        
        
        
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver: self];
}

- (void) willResignActiveNotification:(NSNotification*) notification  {
    NSLog(@"clone @@@@@@@@ runs UIApplicationWillResignActiveNotification ");
}


- (void) didEnterBackgroundNotification : (NSNotification*) notification {
    NSLog(@"clone @@@@@@@ runs didEnterBackgroundNotification");
}

- (void) willEnterForegroundNotification:(NSNotification*) notification {
    NSLog(@"clone @@@@@@@@ runs willEnterForegroundNotification");
}

- (void) didBecomeActiveNotification : (NSNotification*) notification {
    NSLog(@"clone @@@@@@@ runs didBecomeActiveNotification");
}

- (void) willTerminateNotification:(NSNotification*) notification {
    NSLog(@"clone @@@@@@@ runs willTerminateNotification");}

@end





