//
//  Chromosome.m
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Chromosome.h"

@implementation Chromosome

@synthesize genePairs;

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	self.genePairs = [aDecoder decodeObjectForKey:@"genePairs"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.genePairs forKey:@"genepairs"];
}

#pragma mark NSCopying

-(id)copyWithZone:(NSZone *)zone {
	return [self copy];
}

#pragma mark NSCoding

-(id)init {
	return [self initWithGenePairs:[NSArray array]];
}

-(id)initWithGenePairs:(NSArray *)_genePairs {
	self.genePairs = _genePairs;
	return self;
}

#pragma mark properties

-(int)geneCount {
	return [self.genePairs count];
}

-(void)setGenePairs:(NSArray *)genePairs {

}

@end
