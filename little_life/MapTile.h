//
//  MatTile.h
//  little_life
//
//  Created by Matthes on 22.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MapTile;
@class Organism;

@protocol MapTileAccessProtocol 

-(BOOL)organismCanEnterMapTile:(MapTile *)tile;
-(BOOL)organismCanLeaveMapTile:(MapTile *)tile;

@end

@interface MapTile : NSObject <NSCoding> {
	NSNumber *altitude;
}

@property (strong, nonatomic) NSNumber *altitude;

-(id)init;
-(id)initWithAltitude:(NSNumber *)theAltitude;

@end
