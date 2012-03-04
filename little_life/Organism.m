//
//  Organism.m
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Organism.h"

@implementation Organism

-(id)initWithCoder:(NSCoder *)aDecoder {
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
}

-(BOOL)organismCanEnterMapTile:(MapTile *)tile {
	return YES;
}

-(BOOL)organismCanLeaveMapTile:(MapTile *)tile {
	return YES;
}

@end
