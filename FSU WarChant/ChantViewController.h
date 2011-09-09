//
//  ChantViewController.h
//  FSU WarChant
//
//  Created by Richard Kirk on 9/9/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface ChantViewController : UIViewController<AVAudioPlayerDelegate> {
    UIButton *megaphoneButton;
    UILabel *topLabel;
    NSNumber *index;
    AVAudioPlayer *player;  

    
    
}

@property (strong, nonatomic) IBOutlet UIButton *megaphoneButton;
@property (strong, nonatomic) IBOutlet UILabel *topLabel;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) NSNumber *index;

- (IBAction)megaphonePressed:(id)sender;

-(id)initWithIndex:(int)idx;

@end

