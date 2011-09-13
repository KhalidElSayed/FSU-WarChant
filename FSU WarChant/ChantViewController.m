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
@synthesize delegate;
@synthesize  songs;


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
    
    self.topLabel.text = [songs objectAtIndex:[self.index unsignedIntegerValue]];

    
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
    
    [self.delegate didSelectMegaphone:self.index.intValue];

}















@end
