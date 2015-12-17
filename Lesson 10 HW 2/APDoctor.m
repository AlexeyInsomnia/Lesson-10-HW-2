//
//  APDoctor.m
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APDoctor.h"
#import "APGovernment.h"
#import "AppDelegate.h"

@implementation APDoctor

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
          // this is subscribing for Notification for doctor's (look down code)
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(salaryChangedNotification:)
                   name:APGovernmentSalaryDidChangeNotification
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

- (void) salaryChangedNotification:(NSNotification*) notification {
    
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentSalaryUserInfoKey];
    
    float salary = [value floatValue];
    float percentChangeSalary = (salary/self.salary)*100-100;
    
    NSLog(@"doctors-salary(new): %.2f and salary(old).self: %.2f, in percent: %.2f %%",salary, self.salary, percentChangeSalary );
    self.percentChangeSalary = percentChangeSalary ;
    
    
    if (salary < self.salary) {
        NSLog(@"Doctors are NOT happy, cause salary now lower, %.2f", self.salary);
    } else {
        NSLog(@"Doctors are happy, cause salary now upper, %.2f", self.salary);
    }
    
    self.salary = salary;
    
    if (self.percentChangeSalary > self.percentChangeAverageprice) {
        NSLog(@"doctos are happy about inflation");
    } else {
        NSLog(@"doctos are NOT happy about inflation");
    }
     
    
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {
        
    NSNumber* value = [notification.userInfo objectForKey:APGovernmentAveragePriceUserInfoKey];
    
    float averagePrice = [value floatValue];
    float percentAvePrice = (averagePrice/self.averagePrice)*100-100;
    
    
    self.percentChangeAverageprice = percentAvePrice ;
    
    
    NSLog(@"inflation is - %.2f %%", self.percentChangeAverageprice);
}


- (void) applicationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"***********************************doctor goes to sleep");
}

- (void) applicationWillEnterForeground:(NSNotification*) notification {
    NSLog(@"******************************************doctor awakenes");
}


@end
