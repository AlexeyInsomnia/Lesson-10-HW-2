//
//  APBusinessman.m
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APBusinessman.h"
#import "APGovernment.h"
#import "AppDelegate.h"

@implementation APBusinessman


- (id)init
{
    self = [super init];
    if (self) {
        // this is subscribing
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
   
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:APGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:APGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(applicationDidEnterBackground:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(applicationWillEnterForeground:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    
    }
    return self;
}

// !!!!! VERY IMPORTANT TO UNSUBSCRIBE FROM NOTOFICATION (LOOK DOWN CODE)
- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notifications

-  (void) taxLevelChangedNotification:(NSNotification*) notification {
    NSLog(@"businessman got notification about taxLevel change");
    
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentSalaryUserInfoKey];
    
    float taxLevel = [value floatValue];
    float percentChangeTaxes = (taxLevel/self.taxLevel)*100-100;
    
    
    self.percentChangeTaxLevel = percentChangeTaxes ;
    
    
    
    if (self.percentChangeTaxLevel > self.percentChangeAverageprice) {
        NSLog(@"business is NOT happy about inflation");
    } else {
        NSLog(@"business HAPPY happy about inflation");
    }
    
}


- (void) averagePriceChangedNotification:(NSNotification*) notification {
    NSLog(@"busines got notification about averagePrice change, new data is:%.2f", self.averagePrice);
    
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentAveragePriceUserInfoKey];
    
    float averagePrice = [value floatValue];
    float percentAvePrice = (averagePrice/self.averagePrice)*100-100;
    
    
    self.percentChangeAverageprice = percentAvePrice ;
    
    
    //NSLog(@"percent change average price - %.2f %%", self.percentChangeAverageprice);
    
}

- (void) applicationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"***********************************business goes to sleep");
}

- (void) applicationWillEnterForeground:(NSNotification*) notification {
    NSLog(@"******************************************business awakenes");
}

@end
