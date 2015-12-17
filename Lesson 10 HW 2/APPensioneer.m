//
//  APPensioneer.m
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APPensioneer.h"
#import "APGovernment.h"
#import "AppDelegate.h"

@implementation APPensioneer

- (id)init
{
    self = [super init];
    if (self) {
        // this is subscribing
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(pensionChangedNotification:)
                   name:APGovernmentPensionDidChangeNotification
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

-  (void) pensionChangedNotification:(NSNotification*) notification {
    NSLog(@"pensioneer got notification about pension change");
    
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentSalaryUserInfoKey];
    
    float pension = [value floatValue];
    float percentChangePension = (pension/self.pension)*100-100;
    
    
    self.percentChangePension = percentChangePension ;
    
    
    
    if (self.percentChangePension > self.percentChangeAverageprice) {
        NSLog(@"pensionneer is  happy about inflation");
    } else {
        NSLog(@"pensionner NOT HAPPY happy about inflation");
    }
    
}


- (void) averagePriceChangedNotification:(NSNotification*) notification {
    NSLog(@"pensionner got notification about averagePrice change, new data is:%.2f", self.averagePrice);
  
    
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentAveragePriceUserInfoKey];
    
    float averagePrice = [value floatValue];
    float percentAvePrice = (averagePrice/self.averagePrice)*100-100;
    
    
    self.percentChangeAverageprice = percentAvePrice ;
    
    
}

- (void) applicationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"***********************************pensioneer goes to sleep");
}

- (void) applicationWillEnterForeground:(NSNotification*) notification {
    NSLog(@"******************************************pensionner awakenes");
}

@end
