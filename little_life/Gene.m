//
//  Gene.m
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Gene.h"

@interface Gene (hidden)

-(NSString *)randomAtt;
-(NSNumber *)randomStrength;
-(NSNumber *)randomEffect;
-(NSNumber *)effectRange;

@end

@implementation Gene

@synthesize strength, effect, affectedAttribute;

#pragma mark private methods

#pragma mark attribute

-(NSString *)randomAtt {
	return @"*";
}

#pragma mark strength

-(NSNumber *)maxStrength {
	return [NSNumber numberWithInt:100];
}

-(NSNumber *)minStrength {
	return [NSNumber numberWithInt:0];
}

-(NSNumber *)randomStrength {
	float f = arc4random()%[[self maxStrength] intValue];
	return [NSNumber numberWithFloat:f]; // 0..100
}

#pragma mark effect

-(NSNumber *)randomEffect {
	float f = arc4random()%[[self effectRange] intValue] + 90.0f;
	return [NSNumber numberWithFloat:f];// 90..110
}

-(NSNumber *)effectRange {
	return [NSNumber numberWithInt:20];
}

-(NSNumber *)maxPosEffect {
	return [NSNumber numberWithInt:([[self effectRange] intValue] * .5f)+100];
}

-(NSNumber *)maxNegEffect {
	return [NSNumber numberWithInt:([[self effectRange] intValue] * -.5f)+100];
}

#pragma mark NSCoding

-(id)initWithCoder:(NSCoder *)aDecoder {
	self.strength = [aDecoder decodeObjectForKey:@"strength"];
	self.effect = [aDecoder decodeObjectForKey:@"effect"];
	self.affectedAttribute = [aDecoder decodeObjectForKey:@"affectedAttribute"];
	return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:self.strength forKey:@"strength"];
	[aCoder encodeObject:self.effect forKey:@"effect"];
	[aCoder encodeObject:self.affectedAttribute forKey:@"affectedAttribute"];
}

#pragma mark NSCopying

-(id)copyWithZone:(NSZone *)zone {
	return [self copy];
}

#pragma mark initializers

-(id)init {
	return [self initRandomGene];
}

-(id)initRandomGene {
	return [self initWithAffectedAttribute:[self randomAtt]
									effect:[self randomEffect] 
							   andStrength:[self randomStrength]];
}

-(id)initWithAffectedAttribute:(NSString *)affAtt 
					  strength:(NSNumber *)theStrength {
	return [self initWithAffectedAttribute:affAtt
									effect:[self randomEffect] 
							   andStrength:theStrength];
}

-(id)initWithAffectedAttribute:(NSString *)affAtt 
						effect:(NSNumber *)_effect {
	return [self initWithAffectedAttribute:affAtt 
									effect:_effect 
							   andStrength:[self randomStrength]];
}

-(id)initWithAffectedAttribute:(NSString *)affAtt 
						effect:(NSNumber *)_effect 
				   andStrength:(NSNumber *)_strength {
	self.affectedAttribute = affAtt;
	self.effect = _effect;
	self.strength = _strength;
	return self;
}

#pragma mark properties

-(void)setStrength:(NSNumber *)_strength {
	if ([_strength compare:[self maxStrength]] == NSOrderedDescending) {
		strength = [self maxStrength];
	} else if ([_strength compare:[self minStrength]] == NSOrderedAscending) {
		strength = [self minStrength];
	} else {
		strength = _strength;
	}
}

-(void)setEffect:(NSNumber *)_effect {
	if([_effect compare:[self maxNegEffect]] == NSOrderedDescending) {
		effect = [self maxNegEffect];
	} else if([_effect compare:[self maxPosEffect]] == NSOrderedAscending) {
		effect = [self maxPosEffect];
	} else {
		effect = _effect;
	}
}

-(BOOL)isRandom {
	return [self.affectedAttribute compare:[self randomAtt]] == NSOrderedSame;
}

@end
