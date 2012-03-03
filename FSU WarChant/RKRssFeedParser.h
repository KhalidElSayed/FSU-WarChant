//
//  RKRssFeedParser.h
//  FSU WarChant
//
//  Created by Richard Kirk on 9/13/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKRssItem.h"

@interface RKRssFeedParser : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *feedItems;
    NSURL *feedURL;
    NSXMLParser *myParser;
    bool passedGen;
    RKRssItem *tempItem;
    
}
@property (strong, nonatomic)NSMutableArray *feedItems;
@property (strong, nonatomic)NSURL *feedURL;
@property (strong, nonatomic)NSXMLParser *myParser;

-(NSArray *)retrieveAll;

-(id)initWithURL:(NSURL *)feed;


@end
