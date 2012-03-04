//
//  Map.h
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapTile.h"
@class Map;

@protocol MapChangeProtocol 

-(void)map:(Map *)map waterLevelChanged:(NSNumber *)newWaterLevel;

@end

@interface Map : NSObject <NSCoding> {
	NSArray *mapTiles;
}

@property (strong, nonatomic) NSArray *mapTiles;
@property (strong, nonatomic) NSNumber *waterLevel;

-(id)init;
-(id)initWithSize:(int)size;
-(id)initWithSize:(int)size andWaterLevel:(NSNumber *)waterLevel;

@end
