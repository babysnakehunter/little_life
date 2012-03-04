//
//  little_lifeTests.h
//  little_lifeTests
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Gene.h"
#import "GenePair.h"

@interface little_lifeTests : SenTestCase {
	Gene *dominantGene, *strongGene, *weakGene, *recessiveGene, *g, *g2;
	GenePair *gp;
}

@end
