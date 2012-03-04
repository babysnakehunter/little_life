//
//  World.m
//  little_life
//
//  Created by Matthes on 20.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "World.h"

@interface World (hidden)

-(void)resetInternals;
-(NSTimeInterval)defaultTimerInterval;
-(void)initializeTimer;
-(void)initializeTimerWithInterval:(NSTimeInterval)interval;
-(int)timerSpeedStep;
-(int)timerMinSpeed;
-(int)timerMaxSpeed;
-(void)changeTimerSpeedWithFactor:(int)factor;

@end

@implementation World

@synthesize timer, timerSpeed, secondsPassed, created;
@synthesize map;

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	self.map = [aDecoder decodeObjectForKey:@"map"];
	if(!self.map) {
		self.map = [[Map alloc] init];
	}
	self.created = [aDecoder decodeObjectForKey:@"created"];
	[self resetInternals];
	[self initializeTimer];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.created forKey:@"created"];
	[aCoder encodeObject:self.map forKey:@"map"];
}

#pragma mark initializers

-(id)init {
	[self resetInternals];
	[self initializeTimer];
	self.created = [NSDate date];
	return self;
}

-(void)resetInternals {
	self.timerSpeed = [self timerMinSpeed];
	self.secondsPassed = 0;
}

#pragma mark timer

-(NSTimeInterval)defaultTimerInterval {
	return 1.0f;
}

-(NSTimeInterval)timerSpeed {
	return timerSpeed;
}

-(void)setTimerSpeed:(NSTimeInterval)_timerSpeed {
	timerSpeed = _timerSpeed;
	if (timerSpeed > [self timerMaxSpeed]) {
		timerSpeed = [self timerMaxSpeed];
	} else if(timerSpeed < [self timerMinSpeed]) {
		timerSpeed = [self timerMinSpeed];
	}
	[self initializeTimer];
}

-(int)timerSpeedStep {
	return 2;
}

-(int)timerMinSpeed {
	return 1;
}
							
-(int)timerMaxSpeed {
	return 8;
}

-(void)increaseTimerSpeed:(id)sender {
	self.timerSpeed = self.timerSpeed*[self timerSpeedStep];
}

-(void)decreaseTimerSpeed:(id)sender {
	self.timerSpeed = self.timerSpeed/[self timerSpeedStep];
}

-(NSTimeInterval)timerInterval {
	return [self defaultTimerInterval]/[self timerSpeed];
}

-(void)initializeTimer {
	[self initializeTimerWithInterval:[self timerInterval]];
}

-(void)initializeTimerWithInterval:(NSTimeInterval)interval {
	[self.timer invalidate];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:interval
									 target:self
								   selector:@selector(timerFired:)
								   userInfo:nil
									repeats:YES];
}

-(void)timerFired:(NSTimer *)_timer {
	self.secondsPassed+=1;
	NSLog(@"sec: %u", self.secondsPassed);
	if(self.secondsPassed%5 == 0) {
		if(self.secondsPassed%2) {
		//	[self increaseTimerSpeed:nil];
		} else {
		//	[self decreaseTimerSpeed:nil];
		}
		//NSLog(@"timerSpeed %f", self.timerSpeed);
	}
}

@end
