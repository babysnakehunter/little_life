//
//  World.h
//  little_life
//
//  Created by Matthes on 20.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"

@interface World : NSObject <NSCoding> {
	Map *map;
}

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) NSDate *created;
@property (assign) NSTimeInterval timerSpeed;
@property (assign) int secondsPassed;
@property (strong, nonatomic) Map *map;

-(id)init;
-(IBAction)increaseTimerSpeed:(id)sender;
-(IBAction)decreaseTimerSpeed:(id)sender;

@end
