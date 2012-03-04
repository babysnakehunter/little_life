//
//  Gene.h
//  little_life
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Gene : NSObject <NSCoding, NSCopying> {
	NSNumber *strength;
	NSNumber *effect;
	NSString *affectedAttribute;
}

@property (strong, nonatomic) NSNumber *strength;
@property (strong, nonatomic) NSNumber *effect;
@property (strong, nonatomic) NSString *affectedAttribute;
@property (readonly) BOOL isRandom;

-(id)init;
-(id)initRandomGene;
-(id)initWithAffectedAttribute:(NSString *)affAtt
						effect:(NSNumber *)_effect;
-(id)initWithAffectedAttribute:(NSString *)affAtt 
					  strength:(NSNumber *)theStrength;
-(id)initWithAffectedAttribute:(NSString *)affAtt 
						effect:(NSNumber *)_effect 
				   andStrength:(NSNumber *)_strength;

-(NSNumber *)maxNegEffect;
-(NSNumber *)maxPosEffect;
-(NSNumber *)maxStrength;
-(NSNumber *)minStrength;

@end
