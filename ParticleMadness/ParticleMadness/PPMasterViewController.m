//
//  PPMasterViewController.m
//  ParticleMadness
//
//  Created by Helene Brooks on 11/15/11.
//  Copyright (c) 2011 vaughn. All rights reserved.
//

#import "PPMasterViewController.h"

#import "PPDetailViewController.h"

@implementation PPMasterViewController
@synthesize sliders;
@synthesize labels;

@synthesize birthRateSlider;
@synthesize birthRateLabel;
@synthesize detailViewController = _detailViewController;
@synthesize particle;

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.detailViewController = (PPDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
   // self.particle = self.detailViewController.paticleView;
    
}

- (void)viewDidUnload
{
    [self setBirthRateSlider:nil];
    [self setBirthRateLabel:nil];
    [self setSliders:nil];
    [self setLabels:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"touched %d",indexPath.row);
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (IBAction)setBirthRateForParticles:(id)sender {
    NSString *birthString = [NSString stringWithFormat:@"%.0f",self.birthRateSlider.value];
    self.birthRateLabel.text = birthString;
    [self.detailViewController.paticleView setBirthRate:[NSNumber numberWithFloat:self.birthRateSlider.value]];
}



- (IBAction)slidSlider:(id)sender {
    UISlider *pickedSlider = (UISlider*)sender;
    
    for (UISlider *slider in self.sliders) {
        if ([slider tag] == [sender tag]) {
            NSLog(@"sender tag %d",[sender tag]);
            pickedSlider = slider;
            [self setParticleDynamicsForType:[sender tag] value:[NSNumber numberWithFloat:pickedSlider.value]];
        }
    }
    for (UILabel *label in labels) {
        if ([label tag] == [sender tag]+10) {
            if ([label tag] == 16 || [label tag] == 17 || [label tag] == 14 || [label tag] == 15 || [label tag] == 18 || [label tag] == 19) {
                NSString *labelString = [NSString stringWithFormat:@"%.1f",pickedSlider.value];
                [label setText:labelString];
              }
            else{
            NSString *labelString = [NSString stringWithFormat:@"%.0f",pickedSlider.value];
            [label setText:labelString];
            }
        }
    }
}

- (void)setParticleDynamicsForType:(NSInteger)sliderTag value:(NSNumber*)value{
   // NSLog(@"Dynamic setter With tag:%d",sliderTag);
    switch (sliderTag) {
        case 1:
            NSLog(@"1");
            break;
        case 2:
            NSLog(@"2");
            [self.detailViewController.paticleView setVelocity:value]; 
            break;
        case 3:
            NSLog(@"3");
            [self.detailViewController.paticleView setVrange:value];
            break;
        case 4:
            NSLog(@"setting scale %@",value);
            [self.detailViewController.paticleView setScale:value];
            break;
        case 5:
            NSLog(@"setting ScaleRange %@",value);
            [self.detailViewController.paticleView setsRange:value];
            break;
        case 6:
            NSLog(@"alpha range %@",value);
            [self.detailViewController.paticleView setPaticleAlpha:value];
            break;
        case 7:
            NSLog(@"alpha speed %@",value);
            [self.detailViewController.paticleView setParticleAlphaRange:value];
            break;
        case 8:
            NSLog(@"lifetime %@",value);
            [self.detailViewController.paticleView setParticleLifetime:value];
            break;
        case 9:
            NSLog(@"lifetime range %@",value);
            [self.detailViewController.paticleView setParticleLifetimeRange:value];
            break;
            
        default:
            break;
    }
}
















@end
