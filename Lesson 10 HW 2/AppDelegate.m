//
//  AppDelegate.m
//  Lesson 10 HW 2
//
//  Created by Alex on 17.12.15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "AppDelegate.h"
#import "APGovernment.h"
#import "APDoctor.h"
#import "APBusinessman.h"
#import "APPensioneer.h"
#import "APCloneAppDelegate.h"


@interface AppDelegate ()

@property (strong, nonatomic) APGovernment* government;
@property (strong, nonatomic) APPensioneer* pensioneer;
@property (strong, nonatomic) APBusinessman* businessman;
@property (strong, nonatomic) APDoctor* doctor;
@property (strong, nonatomic) APCloneAppDelegate* cloneAppDelegate;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    // this is subscribing for Notification for self.appDelegate (look down code)
    /* this is for notification of the Government
    NSNotificationCenter* nc =[NSNotificationCenter defaultCenter];
    
    [nc addObserver:self
                    selector:@selector(governmentNotification:)
                    name:APGovernmentTaxLevelDidChangeNotification
                    object:nil];
    
    [nc addObserver:self
           selector:@selector(averagePriceChangedNotification:)
               name:APGovernmentAveragePriceDidChangeNotification
             object:nil];
    */
    
    self.government = [[APGovernment alloc] init];
    self.pensioneer = [[APPensioneer alloc] init];
    self.businessman = [[APBusinessman alloc] init];
    self.doctor = [[APDoctor alloc] init];
    self.cloneAppDelegate = [[APCloneAppDelegate alloc] init];
    
    APDoctor* doctor1 = [[APDoctor alloc] init];
    doctor1.salary = self.government.salary;
    
    APBusinessman* businessman1 = [[APBusinessman alloc] init];
    
    APPensioneer* pensionner1 = [[APPensioneer alloc] init];
    
    
    
    doctor1.averagePrice = businessman1.averagePrice = pensionner1.averagePrice = self.government.averagePrice;
    

    //APBusinessman* businessman1 = [[APBusinessman alloc] init];
    
  
    
    
    self.government.averagePrice = 15;
    self.government.taxLevel = 5.5;
    self.government.salary = 900;
    self.government.pension = 550;
    
    
    self.government.salary = 3000;
    
    //NSLog(@"%.2f", doctor1.percentChangeSalary);
  

    return YES;
}

/*
- (void) governmentNotification:(NSNotification*) notification {
    
    NSLog(@"governmentNotification userInfo = %@", notification.userInfo);
    
}

- (void) averagePriceChangedNotification:(NSNotification*) notification {
    

    
    

}
 */


// !!!!! VERY IMPORTANT TO UNSUBSCRIBE FROM NOTOFICATION (LOOK DOWN CODE)
- (void) dealloc {
    //[[NSNotificationCenter defaultCenter] removeObserver:self name:APGovernmentTaxLevelDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"original AppDelegate runs applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"original AppDelegate runs applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"original AppDelegate runs applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"original AppDelegate runs applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"original AppDelegate runs applicationWillTerminate");
}

@end
