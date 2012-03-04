//
//  Chromosome.h
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Chromosome : NSObject <NSCoding, NSCopying> {
	NSArray *genePairs;
}

@property (readonly) int geneCount;
@property (strong, nonatomic) NSArray *genePairs;

-(id)init;
-(id)initWithGenePairs:(NSArray *)genePairs;

@end
