//
//  little_lifeTests.m
//  little_lifeTests
//
//  Created by Matthes on 19.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "little_lifeTests.h"

@implementation little_lifeTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
	g = [[Gene alloc] initRandomGene];
	g2 = [[Gene alloc] initRandomGene];
	
	dominantGene = [[Gene alloc] initWithAffectedAttribute:@"test" 
												  strength:[NSNumber numberWithInt:100]];
	strongGene = [[Gene alloc] initWithAffectedAttribute:@"test" 
												  strength:[NSNumber numberWithInt:80]];
	weakGene = [[Gene alloc] initWithAffectedAttribute:@"test" 
												  strength:[NSNumber numberWithInt:20]];
	recessiveGene = [[Gene alloc] initWithAffectedAttribute:@"test" 
												  strength:[NSNumber numberWithInt:0]];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    STFail(@"Unit tests are not implemented yet in little_lifeTests");
}

#pragma mark helpers

-(GenePair *)randomGenePair {
	return [[GenePair alloc] initWithGenes:[NSArray arrayWithObjects:[[Gene alloc] initRandomGene],
											[[Gene alloc] initRandomGene], nil]];
}

#pragma mark gene tests

-(void)testRandomConstructor {
	for (int i = 0; i < 100; i++) {
		g = [[Gene alloc] initRandomGene];
		g2 = [[Gene alloc] initRandomGene];
		BOOL equal = (g.strength == g2.strength);
		STAssertFalse(equal, @"Random genes should differ");
	}
}

-(void)testRandomStrengthInRange {
	for(int i = 0; i < 100; i++) {
		g.strength = [g performSelector:@selector(randomStrength)];
		BOOL lessThanMax = [g.strength intValue] <= [[g maxStrength] intValue];
		BOOL moreThanMin = [g.strength intValue] >= [[g minStrength] intValue];
		STAssertTrue(lessThanMax&&moreThanMin, @"strength is %u", [g.strength intValue]);
	}
}

-(void)testGeneStrengthTooHigh {
	NSNumber *tooHigh = [NSNumber numberWithInt:101];
	g.strength = tooHigh;
	STAssertEqualObjects(g.strength, [g maxStrength], @"Gene strength should have top border of 100");
}

-(void)testGeneStrengthMax {
	g.strength = [NSNumber numberWithInt:100];
	STAssertEqualObjects(g.strength, [g maxStrength], @"Gene strength should be maxed");
}

-(void)testGeneStrengthTooLow {
	g.strength = [NSNumber numberWithInt:-1];
	STAssertEqualObjects(g.strength, [g minStrength], @"Gene strength should have lower border of 0");
}

-(void)testGeneStrengthMin {
	g.strength = [NSNumber numberWithInt:0];
	STAssertEqualObjects(g.strength, [g minStrength], @"Gene strength should be minimum");
}

-(void)testGeneStrengthCorrectlySet {
	g.strength = [NSNumber numberWithInt:70];
	STAssertEqualObjects(g.strength, [NSNumber numberWithInt:70], @"Gene strength within 0..100 range is accepted");
}

-(void)testMaxPosEffect {
	STAssertEquals([[g maxPosEffect] intValue], 110, @"maxPosEffect should be 110");
}

-(void)testMaxNegEffect {
	STAssertEquals([[g maxNegEffect] intValue], 90, @"maxNegEffect should be 90");
}

-(void)testRandomEffectInRange {
	for (int i = 0; i < 100; i++) {
		g.effect = [g performSelector:@selector(randomEffect)];
		BOOL lessThanMax = [g.effect intValue] <= [[g maxPosEffect] intValue];
		BOOL moreThanMin = [g.effect intValue] >= [[g maxNegEffect] intValue];
		STAssertTrue(lessThanMax&&moreThanMin, @"effect is %u", [g.effect intValue]);
	}
}

#pragma mark gene pair tests

-(void)testSingleGeneConstructor {
	gp = [[GenePair alloc] initWithSingleGene:g];
	int count = [gp.genes count];
	STAssertEquals(count, 2, @"SingleGeneConstructor should produce 2 genes");
}

-(void)testEmptyArrayOrNilCreatesRandomGenes {
	gp = [[GenePair alloc] initWithGenes:nil];
	STAssertTrue(gp.firstGene.isRandom , @"Empty GeneArray or nil should create random genes");
	STAssertTrue(gp.otherGene.isRandom , @"Empty GeneArray or nil should create random genes");
	gp = [[GenePair alloc] initWithGenes:[NSArray array]];
	STAssertTrue(gp.firstGene.isRandom , @"Empty GeneArray or nil should create random genes");
	STAssertTrue(gp.otherGene.isRandom , @"Empty GeneArray or nil should create random genes");
}

-(void)testResultingGenePairStrength {
	gp = [[GenePair alloc] initWithGenes:[NSArray arrayWithObjects:dominantGene, weakGene, nil]];
	/*
	 STAssertEqualObjects(gp.strength, [NSNumber numberWithInt:@"0.6"], 
						 @"Resulting strength should be average of gene values");
	 */
}

#pragma mark chromosome tests

@end
