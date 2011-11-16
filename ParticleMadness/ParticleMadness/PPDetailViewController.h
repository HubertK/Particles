//
//  PPDetailViewController.h
//  ParticleMadness
//
//  Created by Helene Brooks on 11/15/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Particle.h"

@interface PPDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet Particle *paticleView;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rateButton;
- (IBAction)changeRate:(id)sender;

@end
