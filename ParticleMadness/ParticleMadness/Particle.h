//
//  Particle.h
//  ParticlePlayground
//
//  Created by Helene Brooks on 11/15/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface Particle : UIView
@property (strong, nonatomic) NSNumber *bRate;
@property (nonatomic) float velocityToSet;
@property (nonatomic) float velocityRangeToSet;
@property (nonatomic) float scaleToSet;
@property (nonatomic) float scaleRangeToSet;
@property (nonatomic) float alphaToSet;
@property (nonatomic) float alphaRangeToSet;
@property (nonatomic) float lifetimeToSet;
@property (nonatomic) float lifetimeRangeToSet;
@property (strong, nonatomic) CAEmitterLayer* sparkEmitter;
- (void)setBirthRate:(NSNumber*)aRate;
- (void)setVelocity:(NSNumber*)aVelocity;
- (void)setVrange:(NSNumber*)vRange;
- (void)setScale:(NSNumber*)aScale;
- (void)setsRange:(NSNumber *)sRange;
- (void)setPaticleAlpha:(NSNumber*)alpha;
- (void)setParticleAlphaRange:(NSNumber*)aRange;
- (void)setParticleLifetime:(NSNumber*)aLifetime;
- (void)setParticleLifetimeRange:(NSNumber*)aLifetimeRange;
@end
