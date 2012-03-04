//
//  AppDelegate.h
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "World.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) World *world;
@property (strong, nonatomic) UIWindow *window;

@end
