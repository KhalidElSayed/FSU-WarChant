//
//  ViewController.h
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, AVAudioPlayerDelegate>
{
   
    NSMutableArray *chants;
    AVAudioPlayer *mainPlayer;
    
    
    UIScrollView *scrollView;
}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) AVAudioPlayer *mainPlayer;
@property (strong, nonatomic) NSMutableArray *chants;


@end
