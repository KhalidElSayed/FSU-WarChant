//
//  ViewController.m
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "ViewController.h"
#import "ChantViewController.h"




#define kNumberOfPages 8

@interface ViewController (PrivateMethods)


-(void)loadScrollViewWithPage:(int)page;
-(void)setUpPlayer;

@end

@implementation ViewController

@synthesize scrollView;
@synthesize chants;
@synthesize mainPlayer;
@synthesize songArray;
@synthesize indexPlaying;
@synthesize sliderPageControl;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.songArray = [NSArray arrayWithObjects:@"War Chant",@"FSU Fight Song",@"Gold And Garnett", @"FSU Cheer",@"4th Quarter Fanfare",@"Old FSU Fight Song",@"Seminole Uprising",@"Victory Song",@"sorryAmerica",nil];
    
    
    self.scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"robots.png"]];
    self.scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    chants = controllers;
    
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
		    [self loadScrollViewWithPage:i];    }


  
    
    [self setUpPlayer];

    self.sliderPageControl = [[SliderPageControl  alloc] initWithFrame:CGRectMake(0,[self.view bounds].size.height-20,[self.view bounds].size.width,20)];
    [self.sliderPageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.sliderPageControl setDelegate:self];
    [self.sliderPageControl setShowsHint:YES];
    [self.view addSubview:self.sliderPageControl];

    [self.sliderPageControl setNumberOfPages:kNumberOfPages];
    [self.sliderPageControl setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];

    [self changeToPage:1 animated:NO];

    
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
        controller.songs = self.songArray;
        controller.delegate = self;
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView_
{
	pageControlUsed = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    
     if (pageControlUsed)
     {
     // do nothing - the scroll was initiated from the page control, not the user dragging
     return;
     }
     
    
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    // pageControl.currentPage = page;
    [sliderPageControl setCurrentPage:page animated:YES];
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView_
{
	pageControlUsed = NO;
}

-(void)didSelectMegaphone:(int)index
{       
    
    if (!self.indexPlaying) {
        self.indexPlaying = [[NSNumber alloc]initWithInt:index];
    }
    
    
    
    if( self.indexPlaying != [NSNumber numberWithInt:index])
    {
        self.indexPlaying = [NSNumber numberWithInt:index];
        if (self.mainPlayer) {
            if ([self.mainPlayer isPlaying])
                [self.mainPlayer stop];
        }
        
        
        NSString *fileName = [self.songArray objectAtIndex:[[NSNumber numberWithInt:index] unsignedIntegerValue] ];    
        
        NSString *path = [[NSBundle mainBundle]
                          pathForResource:fileName ofType:@"mp3"];
        [NSURL fileURLWithPath:path];
        
        
        NSError *error = [[NSError alloc]init];
        
        [self.mainPlayer initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
        
        if(error)
            NSLog(@"%@",error);
        
        self.mainPlayer.delegate = self;
        [self.mainPlayer play];
    }
    else
    {
        if ([self.mainPlayer isPlaying])
            [self.mainPlayer pause];
        else 
            [self.mainPlayer play];
        
    }
}

-(void)setUpPlayer
{
    NSString *fileName = [self.songArray objectAtIndex:[[NSNumber numberWithInt:0] unsignedIntegerValue] ];    
    
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:fileName ofType:@"mp3"];
    [NSURL fileURLWithPath:path];
    
    
    NSError *error = [[NSError alloc]init];
    
    self.mainPlayer = [[AVAudioPlayer alloc ] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
    
    if(error)
        NSLog(@"%@",error);
    
    
}

#pragma mark sliderPageControlDelegate

- (NSString *)sliderPageController:(id)controller hintTitleForPage:(NSInteger)page
{
	return [self.songArray objectAtIndex:[[NSNumber numberWithInteger:page] unsignedIntegerValue]];
}

- (void)onPageChanged:(id)sender
{
	pageControlUsed = YES;
	[self slideToCurrentPage:YES];
	
}

- (void)slideToCurrentPage:(bool)animated 
{
	int page = sliderPageControl.currentPage;
	
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:animated]; 
}

- (void)changeToPage:(int)page animated:(BOOL)animated
{
	[sliderPageControl setCurrentPage:page animated:YES];
	[self slideToCurrentPage:animated];
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
