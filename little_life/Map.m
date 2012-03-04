//
//  Map.m
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Map.h"

@interface Map (hidden)

-(int)defaultSize;
-(NSNumber *)defaultWaterLevel;

@end

@implementation Map

@synthesize mapTiles, waterLevel;

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	NSLog(@"restore map");
	self.mapTiles = [aDecoder decodeObjectForKey:@"mapTiles"];
	self.waterLevel = [aDecoder decodeObjectForKey:@"waterLevel"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.mapTiles forKey:@"mapTiles"];
	[aCoder encodeObject:self.waterLevel forKey:@"waterLevel"];
}

#pragma mark initializers

-(id)init {
	return [self initWithSize:[self defaultSize]];
}

-(id)initWithSize:(int)size {
	NSLog(@"Map initWithSize(%u)", size);
	return [self initWithSize:size andWaterLevel:[self defaultWaterLevel]];
}

-(id)initWithSize:(int)size andWaterLevel:(NSNumber *)waterlevel {
	self.waterLevel = waterlevel;
	mapTiles = [[NSArray alloc] init];
	for (int i = 0; i < size; i++) {
		NSArray *a = [[NSArray alloc] init];
		for(int j = 0; j < size; j++) {
			MapTile *mt = [[MapTile alloc] init];
			a = [a arrayByAddingObject:mt];
		}
		mapTiles = [mapTiles arrayByAddingObject:a];
	}
	return self;
}

#pragma mark private methods

-(int)defaultSize {
	return 8;
}

-(NSNumber *)defaultWaterLevel {
	return 0;
}

@end
