//
//  APGovernment.h
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const APGovernmentTaxLevelDidChangeNotification;
extern NSString* const APGovernmentSalaryDidChangeNotification;
extern NSString* const APGovernmentPensionDidChangeNotification;
extern NSString* const APGovernmentAveragePriceDidChangeNotification;

extern NSString* const APGovernmentTaxLevelUserInfoKey;
extern NSString* const APGovernmentSalaryUserInfoKey;
extern NSString* const APGovernmentPensionUserInfoKey;
extern NSString* const APGovernmentAveragePriceUserInfoKey;


@interface APGovernment : NSObject

@property (assign, nonatomic) float taxLevel;
@property (assign, nonatomic) float salary;
@property (assign, nonatomic) float pension;
@property (assign, nonatomic) float averagePrice;
@property (assign, nonatomic) float percentChangeAverageprice;


@end
