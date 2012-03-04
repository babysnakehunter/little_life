//
//  Plant.m
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Plant.h"

@implementation Plant

-(id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[super encodeWithCoder:aCoder];
}

-(BOOL)organismCanEnterMapTile:(MapTile *)tile {
	return NO;
}

-(BOOL)organismCanLeaveMapTile:(MapTile *)tile {
	return NO;
}

@end
