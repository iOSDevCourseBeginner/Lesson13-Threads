//
//  NBAppDelegate.m
//  Lesson13>Threads
//
//  Created by Nick Bibikov on 9/2/14.
//  Copyright (c) 2014 NickBibikov. All rights reserved.
//

#import "NBAppDelegate.h"
#import "NBStudent.h"

@interface NBAppDelegate()
@property (strong, nonatomic) NSMutableArray* array;

@end

@implementation NBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//-------------------------------------------------------------------------------
    
    NBStudent* student1 = [[NBStudent alloc] init];
    student1.name = @"Alex";
    
    NBStudent* student2 = [[NBStudent alloc] init];
    student2.name = @"Bob";
    
    NBStudent* student3 = [[NBStudent alloc] init];
    student3.name = @"Mark";

    NSArray* journal = @[student1, student2, student3];

    void (^resultBlock) (NSString*, NSInteger, CGFloat) = ^(NSString* name, NSInteger searchAnswer, CGFloat time) {
        NSLog(@"%@ found answer: %d in %f seconds", name, searchAnswer, time);
        
    }; 
        
        for (NBStudent* student in journal) {
            [student guessAnswer:32 end:1000 andBlock:resultBlock];
            
        }
    
//-------------------------------------------------------------------------------
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
