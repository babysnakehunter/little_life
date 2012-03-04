//
//  MatTile.m
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MapTile.h"

@interface MapTile (hidden)

-(NSNumber *)defaultAltitude;

@end

@implementation MapTile

@synthesize altitude;

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	[aDecoder decodeObjectForKey:@"altitude"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.altitude forKey:@"altitude"];
}

#pragma mark initializers

-(id)init {
	return [self initWithAltitude:[self defaultAltitude]];
}

-(id)initWithAltitude:(NSNumber *)theAltitude {
	self.altitude = theAltitude;
	return self;
}

#pragma mark private methods

-(NSNumber  *)defaultAltitude {
	return [NSNumber numberWithInt:-1];
}

@end
