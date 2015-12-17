//
//  APGovernment.m
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "APGovernment.h"
#import "AppDelegate.h"

NSString* const APGovernmentTaxLevelDidChangeNotification = @"APGovernmentTaxLevelDidChangeNotification";
NSString* const APGovernmentSalaryDidChangeNotification = @"APGovernmentSalaryDidChangeNotification";
NSString* const APGovernmentPensionDidChangeNotification = @"APGovernmentPensionDidChangeNotification";
NSString* const APGovernmentAveragePriceDidChangeNotification = @"APGovernmentAveragePriceDidChangeNotification";

NSString* const APGovernmentTaxLevelUserInfoKey = @"APGovernmentTaxLevelUserInfoKey";
NSString* const APGovernmentSalaryUserInfoKey = @"APGovernmentSalaryUserInfoKey";
NSString* const APGovernmentPensionUserInfoKey = @"APGovernmentPensionUserInfoKey";
NSString* const APGovernmentAveragePriceUserInfoKey = @"APGovernmentAveragePriceUserInfoKey";

@implementation APGovernment

- (id)init
{
    self = [super init];
    if (self) {
        _taxLevel = 5.f;
        _salary = 1000;
        _pension = 500;
        _averagePrice = 10.f;
        
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];

        
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

- (void) setTaxLevel:(float)taxLevel {
    _taxLevel = taxLevel;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:taxLevel] forKey:APGovernmentTaxLevelUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APGovernmentTaxLevelDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setSalary:(float)salary {
    _salary = salary;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:salary] forKey:APGovernmentSalaryUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APGovernmentSalaryDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
}

- (void) setPension:(float)pension {
    
    _pension = pension;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:pension] forKey:APGovernmentPensionUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APGovernmentPensionDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}

- (void) setAveragePrice:(float)averagePrice {
    
    _averagePrice = averagePrice;
    
    NSDictionary* dictionary = [NSDictionary dictionaryWithObject:[NSNumber numberWithFloat:averagePrice] forKey:APGovernmentAveragePriceUserInfoKey];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APGovernmentAveragePriceDidChangeNotification
                                                        object:nil
                                                      userInfo:dictionary];
    
}


- (void) applicationDidEnterBackground:(NSNotification*) notification {
    NSLog(@"*********************************** government goes to sleep");
}

- (void) applicationWillEnterForeground:(NSNotification*) notification {
    NSLog(@"****************************************** government awakenes");
}



@end
