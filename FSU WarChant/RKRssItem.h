//
//  RKRssItem.h
//  FSU WarChant
//
//  Created by Richard Kirk on 9/13/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKRssItem : NSObject
{
    NSString *title;
    NSURL *link;
    NSString *description;
    NSDate *pubDate;
    NSString *category;
}
@property (strong, nonatomic)NSString *title;
@property (strong, nonatomic)NSURL *link;
@property (strong, nonatomic)NSString *description;
@property (strong, nonatomic)NSDate *pubDate;
@property (strong, nonatomic)NSString *category;


@end
