//
//  GenePair.m
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenePair.h"

@implementation GenePair

@synthesize genes;

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	self.genes = [aDecoder decodeObjectForKey:@"genes"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.genes forKey:@"genes"];
}

#pragma mark initializers

-(id)initWithSingleGene:(Gene *)gene {
	return [self initWithGenes:[NSArray arrayWithObjects:gene, gene, nil]];
}

-(id)initWithGenes:(NSArray *)_genes {
	if(_genes == nil || ![_genes count]) {
		_genes = [NSArray arrayWithObjects:[[Gene alloc] init],[[Gene alloc] init],nil];
	}
	self.genes = _genes;
	return self;
}

#pragma mark properties

-(void)setGenes:(NSArray *)_genes {
	int count = [_genes count];
	if(!count) return;
	if(count == 1) {
		_genes = [NSArray arrayWithObjects:[_genes objectAtIndex:0], 
				  [_genes objectAtIndex:0], nil];
	}
	genes = [NSArray arrayWithObjects:[_genes objectAtIndex:0], 
				  [_genes objectAtIndex:1], nil];
}

-(NSString *)affectedAttribute {
	return [[self.genes objectAtIndex:0] affectedAttribute];
}

-(NSNumber *)strength {
	return [NSNumber numberWithFloat:([self.firstGene.strength floatValue]+[self.otherGene.strength floatValue])/2.f];
}

-(Gene *)firstGene {
	return [self.genes objectAtIndex:0];
}

-(Gene *)otherGene {
	return [self.genes objectAtIndex:1];
}

#pragma mark combination methods

-(Gene *)geneForCombination {
	return [self.genes objectAtIndex:arc4random() % [self.genes count]-1];
}

-(GenePair *)combineWithOtherGenePair:(GenePair *)otherPair {
	Gene *myGene = [self geneForCombination];
	Gene *otherGene = [otherPair geneForCombination];
	
	return [[GenePair alloc] initWithGenes:[NSArray arrayWithObjects:myGene, otherGene, nil]];
}

@end
