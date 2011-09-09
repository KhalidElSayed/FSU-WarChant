//
//  ChantViewController.m
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "ChantViewController.h"

@implementation ChantViewController
@synthesize megaphoneButton;
@synthesize topLabel;
@synthesize index;
@synthesize player;

-(id)initWithIndex:(int)idx
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        // Custom initialization
        self.index = [[NSNumber alloc]initWithInt:idx];
        
        
        
        
        
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
    NSString *fileName = [[NSString alloc ]init];
    
    switch ([self.index intValue]) {
        case 0:
            fileName = @"Florida_State__FSU_Cheer";
            break;
        case 1:
            fileName = @"Florida_State__FSU_Fight_Song";
            break;
        case 2:
            fileName = @"Florida_State__4th_Quarter_Fanfare";
            break;
        case 3:
            fileName = @"Florida_State__FSU_Fight_Song_old";
            break;
        case 4:
            fileName = @"Florida_State__Gold_And_Garnett";
            break;
        case 5:
            fileName = @"Florida_State__Seminole_Uprising";
            break;
        case 6:
            fileName = @"Florida_State__Victory_Song";
            break;
        case 7:
            fileName = @"Florida_State__War_Chant";
            break;
        default:
            fileName = @"sorryAmerica";
            break;
    }
    
    self.topLabel.text = fileName;
    
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:fileName ofType:@"mp3"];
    [NSURL fileURLWithPath:path];
    
    
    NSError *error = [[NSError alloc]init];
    
    
    
    if(error)
        NSLog(@"%@",error);
    
    
    player.delegate = self;
    
    

    
}

- (void)viewDidUnload
{
    [self setMegaphoneButton:nil];
    [self setTopLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)megaphonePressed:(id)sender {
    
    if ([self.player isPlaying])
        [player pause];
    else        
    [player play];


}















@end
