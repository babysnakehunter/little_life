//
//  AppDelegate.m
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (hidden)

-(NSString *)bundlePath;
-(NSString *)worldArchive;

@end

@implementation AppDelegate

@synthesize window = _window, world;

#pragma mark private methods

-(NSString *)bundlePath {
	return [[NSBundle mainBundle] bundlePath];
}

-(NSString *)worldArchive {
	return [NSString stringWithFormat:@"%@/world.archive", [self bundlePath]];
}

#pragma mark generic methods

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
	
	@try {
		self.world = [NSKeyedUnarchiver unarchiveObjectWithFile:[self worldArchive]];
	}
	@catch (NSException *e) {
		NSLog(@"Failed to restore world");
	}
	@finally {
		if (!self.world) {
			NSLog(@"Initializing world");
			self.world = [[World alloc] init];
		} else {
			NSLog(@"restored world started at %@", world.created);
		}
	}
	
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
	BOOL saved;
	@try {
		saved = [NSKeyedArchiver archiveRootObject:self.world toFile:[self worldArchive]];
	}
	@catch (NSException *exception) {
		saved = NO;
	}
	NSLog(@"saved progress %u", saved);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	NSLog(@"applicationWillTerminate");
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

@end
