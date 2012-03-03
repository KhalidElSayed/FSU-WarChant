//
//  RKRssFeedParser.m
//  FSU WarChant
//
//  Created by Richard Kirk on 9/13/11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "RKRssFeedParser.h"
#import "RKRssItem.h"

@implementation RKRssFeedParser
@synthesize feedItems, feedURL, myParser;



-(id)initWithURL:(NSURL *)feed
{
    self = [super init];
    if (self) {
        self.myParser = [[NSXMLParser alloc]initWithContentsOfURL:feed];
        self.feedItems = [[NSMutableArray alloc] initWithCapacity:15];
        self.feedURL = feed;
        passedGen = NO;
        [self.myParser parse];
    }
    return self;
    
}


// Document handling methods
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    
}
// sent when the parser begins parsing of the document.
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}
// sent when the parser has completed parsing. If this is encountered, the parse was successful.

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if (passedGen) {
        
        if ([elementName isEqualToString:@"item"])
        {
            tempItem = [[RKRssItem alloc]init];
        }
        if ([elementName isEqualToString:@"title"])
        {
            
        }
        if ([elementName isEqualToString:@"link"])
        {
            
        }
        if ([elementName isEqualToString:@"description"])
        {
            
        }
        if ([elementName isEqualToString:@"pubDate"])
        {
            
        }
        if ([elementName isEqualToString:@"category"])
        {
            
        }
        
        
        
        
    }
}
// sent when the parser finds an element start tag.
// In the case of the cvslog tag, the following is what the delegate receives:
//   elementName == cvslog, namespaceURI == http://xml.apple.com/cvslog, qualifiedName == cvslog
// In the case of the radar tag, the following is what's passed in:
//    elementName == radar, namespaceURI == http://xml.apple.com/radar, qualifiedName == radar:radar
// If namespace processing >isn't< on, the xmlns:radar="http://xml.apple.com/radar" is returned as an attribute pair, the elementName is 'radar:radar' and there is no qualifiedName.

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
// sent when an end tag is encountered. The various parameters are supplied as above.
{
    
    if (passedGen){
        
        
        if ([elementName isEqualToString:@"item"])
        {
            
        }
        if ([elementName isEqualToString:@"title"])
        {
            
        }
        if ([elementName isEqualToString:@"link"])
        {
            
        }
        if ([elementName isEqualToString:@"description"])
        {
            
        }
        if ([elementName isEqualToString:@"pubDate"])
        {
            
        }
        if ([elementName isEqualToString:@"category"])
        {
            
            
            
            
            
        }
        
        
        
        if ([elementName isEqualToString:@"generator"]){
            passedGen = YES;
        }
        
        
        
    }
}


/*


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
// This returns the string of the characters encountered thus far. You may not necessarily get the longest character run. The parser reserves the right to hand these to the delegate as potentially many calls in a row to -parser:foundCharacters:

- (void)parser:(NSXMLParser *)parser foundIgnorableWhitespace:(NSString *)whitespaceString;
// The parser reports ignorable whitespace in the same way as characters it's found.

- (void)parser:(NSXMLParser *)parser foundProcessingInstructionWithTarget:(NSString *)target data:(NSString *)data;
// The parser reports a processing instruction to you using this method. In the case above, target == @"xml-stylesheet" and data == @"type='text/css' href='cvslog.css'"

- (void)parser:(NSXMLParser *)parser foundComment:(NSString *)comment;
// A comment (Text in a <!-- --> block) is reported to the delegate as a single string

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock
{
    NSString *temp = [NSString alloc]initWithData:CDATABlock encoding:utf9
    
}
// this reports a CDATA block to the delegate as an NSData.

- (NSData *)parser:(NSXMLParser *)parser resolveExternalEntityName:(NSString *)name systemID:(NSString *)systemID;
// this gives the delegate an opportunity to resolve an external entity itself and reply with the resulting data.

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;
// ...and this reports a fatal error to the delegate. The parser will stop parsing.

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError;
// If validation is on, this will report a fatal validation error to the delegate. The parser will stop parsing.

*/

@end
