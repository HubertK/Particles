//
//  Particle.m
//  ParticlePlayground
//
//  Created by Helene Brooks on 11/15/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "Particle.h"
#import <QuartzCore/QuartzCore.h>


@implementation Particle
@synthesize sparkEmitter,bRate,velocityToSet,scaleToSet,scaleRangeToSet,velocityRangeToSet,alphaToSet,alphaRangeToSet,lifetimeToSet,lifetimeRangeToSet;


-(void)awakeFromNib
{    self.bRate = [NSNumber numberWithFloat:10];
    self.velocityToSet = 50;
    self.velocityRangeToSet = 50;
    self.scaleToSet = 1;
    self.scaleRangeToSet = 1;
    self.alphaToSet = 1;
    self.alphaRangeToSet = 1;
    self.lifetimeToSet = 5.0;
    self.lifetimeRangeToSet = 5.0;
    self.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.2 alpha:1.0];
    //set ref to the layer
    sparkEmitter = (CAEmitterLayer*)self.layer; 
    sparkEmitter.emitterShape = kCAEmitterLayerLine;
    sparkEmitter.emitterMode = kCAEmitterLayerOutline;
     sparkEmitter.emitterSize = CGSizeMake(300, 30);
    sparkEmitter.emitterPosition = CGPointMake(((self.frame.size.width)/2)-((sparkEmitter.emitterSize.width)/2), ((self.frame.size.height)/2)-(sparkEmitter.emitterSize.height/2));
    sparkEmitter.renderMode = kCAEmitterLayerAdditive;
   
    
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    spark.birthRate = [bRate floatValue];
    spark.lifetime = lifetimeToSet;
    spark.lifetimeRange = lifetimeRangeToSet;
    spark.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] 
                  CGColor];
    spark.contents = (id)[[UIImage imageNamed:@"ember01.png"] CGImage];
    [spark setName:@"spark"];
    spark.velocity = velocityToSet;
    spark.velocityRange = velocityRangeToSet;
    spark.emissionRange = M_PI;
    spark.yAcceleration = -70;
   
    spark.scale = scaleToSet;
    spark.scaleRange = scaleRangeToSet;
    spark.spin = M_PI;
    spark.spinRange = 20;
//    spark.blueRange = 10;
//    spark.blueSpeed = 1.0;
//    spark.redRange = 10;
//    spark.redSpeed = 1;
//    spark.greenRange = 20;
//    spark.greenSpeed = 1;
    spark.alphaRange = alphaToSet;
    spark.alphaSpeed = alphaRangeToSet;
    
    CAEmitterCell* spark2 = [CAEmitterCell emitterCell];
//    spark2.birthRate = 100;
//    spark2.lifetime = 5.0;
//    spark2.lifetimeRange = 10;
////        spark.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] 
////                      CGColor];
//    spark2.contents = (id)[[UIImage imageNamed:@"Smoke1.png"] CGImage];
//    [spark2 setName:@"spark2"];
//    spark2.velocity = 20;
//    spark2.velocityRange = 100;
//    spark2.emissionRange = M_PI;
//    spark2.scale = .5;
//    spark2.scaleRange = 1;
//    spark2.spin = M_PI_4;
//    spark2.spinRange = 10;
//    spark2.blueRange = 10;
//    spark2.blueSpeed = 1.0;
//    spark2.redRange = 10;
//    spark2.redSpeed = 1;
//    spark2.greenRange = 20;
//    spark2.greenSpeed = 1;
//    spark2.alphaRange = 1;
//    spark2.alphaSpeed = 1;
    
    //add the cell to the layer and we're done
   
    sparkEmitter.emitterCells = [NSArray arrayWithObjects:spark,spark2, nil];
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}



- (void)setBirthRate:(NSNumber *)aRate{
    self.bRate = aRate;
    NSLog(@"Particle bRate:%@",self.bRate);
        [sparkEmitter setValue:aRate 
                forKeyPath:@"emitterCells.spark.birthRate"];
}

- (void)setVelocity:(NSNumber*)aVelocity{
    self.velocityToSet = [aVelocity floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:velocityToSet] forKeyPath:@"emitterCells.spark.velocity"];
}
- (void)setVrange:(NSNumber *)vRange{
    self.velocityRangeToSet = [vRange floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:velocityRangeToSet] forKeyPath:@"emitterCells.spark.velocityRange"];
}


- (void)setScale:(NSNumber *)aScale{
    self.scaleToSet = [aScale floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:scaleToSet] forKeyPath:@"emitterCells.spark.scale"];
    
}
- (void)setsRange:(NSNumber *)sRange{
    self.scaleRangeToSet = [sRange floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:scaleRangeToSet] forKeyPath:@"emitterCells.spark.scaleRange"];
    
}


- (void)setPaticleAlpha:(NSNumber*)alpha{
    self.alphaToSet = [alpha floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:alphaToSet] forKeyPath:@"emitterCells.spark.alphaRange"];
}

- (void)setParticleAlphaRange:(NSNumber*)aRange{
    self.alphaRangeToSet = [aRange floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:alphaRangeToSet] forKeyPath:@"emitterCells.spark.alphaSpeed"];
}

- (void)setParticleLifetime:(NSNumber*)aLifetime{
    self.lifetimeToSet = [aLifetime floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:lifetimeToSet] forKeyPath:@"emitterCells.spark.lifetime"];
}

- (void)setParticleLifetimeRange:(NSNumber*)aLifetimeRange{
    self.lifetimeRangeToSet = [aLifetimeRange floatValue];
    [sparkEmitter setValue:[NSNumber numberWithFloat:lifetimeRangeToSet] forKeyPath:@"emitterCells.spark.lifetimeRange"];
}




@end