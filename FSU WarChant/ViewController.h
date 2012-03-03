//
//  ViewController.h
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

#import "ChantViewController.h"
#import "SliderPageControl.h"

@interface ViewController : UIViewController <UIScrollViewDelegate, AVAudioPlayerDelegate, ChantDelegate, SliderPageControlDelegate>
{
   
    NSMutableArray *chants;
    AVAudioPlayer *mainPlayer;
    NSArray *songArray;
    NSNumber *indexPlaying;
    UIScrollView *scrollView;
    SliderPageControl *sliderPageControl;
    BOOL pageControlUsed;
    
    

}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) AVAudioPlayer *mainPlayer;
@property (strong, nonatomic) NSMutableArray *chants;
@property (strong, nonatomic) NSArray *songArray;
@property (strong, nonatomic) NSNumber *indexPlaying;

@property (strong, nonatomic) SliderPageControl *sliderPageControl;



- (void)slideToCurrentPage:(bool)animated;
- (void)changeToPage:(int)page animated:(BOOL)animated;

@end
