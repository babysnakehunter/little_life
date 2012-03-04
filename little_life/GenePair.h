//
//  GenePair.h
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gene.h"

@interface GenePair : NSObject <NSCoding> {
	NSArray *genes;
}

-(id)initWithSingleGene:(Gene *)gene;
-(id)initWithGenes:(NSArray *)genes;

@property (strong, nonatomic) NSArray *genes;
@property (strong, nonatomic, readonly) NSString *affectedAttribute;
@property (strong, nonatomic, readonly) NSNumber *strength;
@property (strong, nonatomic, readonly) Gene *firstGene;
@property (strong, nonatomic, readonly) Gene *otherGene;

@end
