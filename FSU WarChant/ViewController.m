//
//  ViewController.m
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "ViewController.h"
#import "ChantViewController.h"
#import "AVAudioSession.h"


#define kNumberOfPages 8

@interface ViewController (PrivateMethods)
- (void)loadScrollViewWithPage:(int)page;
@end

@implementation ViewController

@synthesize scrollView;
@synthesize chants;
@synthesize mainPlayer;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
 

    
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"robots.png"]];
    self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
 
    self.mainPlayer = [[AVAudioPlayer alloc]init];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    chants = controllers;
    
    
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    [self loadScrollViewWithPage:2];
    
    
}



- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= [chants count] )
        return;
    
    
    
    
    ChantViewController *controller = [chants objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {   
        
        controller = [[ChantViewController alloc]initWithIndex:page];
        controller.player = self.mainPlayer;
        [controller.view setUserInteractionEnabled:YES];
        [chants replaceObjectAtIndex:page withObject:controller];
              
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {   
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
            
        
        
        [self.scrollView addSubview:controller.view];
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
   /*
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	*/
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
   // pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}





- (void)viewDidUnload
{
    [self setScrollView:nil];
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
