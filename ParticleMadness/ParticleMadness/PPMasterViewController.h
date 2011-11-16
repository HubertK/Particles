//
//  PPMasterViewController.h
//  ParticleMadness
//
//  Created by Helene Brooks on 11/15/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Particle.h"


@class PPDetailViewController;

@interface PPMasterViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UISlider *birthRateSlider;
@property (weak, nonatomic) IBOutlet UILabel *birthRateLabel;

@property (strong, nonatomic) PPDetailViewController *detailViewController;
@property (strong, nonatomic) Particle *particle;
- (IBAction)setBirthRateForParticles:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UISlider) NSArray *sliders;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
- (IBAction)slidSlider:(id)sender;
- (void)setParticleDynamicsForType:(NSInteger)sliderTag value:(NSNumber*)value;
@end
