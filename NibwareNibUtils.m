//
//  NibwareNibUtils.m
//  pingle
//
//  Created by robertsanders on 1/18/09.
//  Copyright 2009 Robert Sanders. All rights reserved.
//

#import "NibwareNibUtils.h"


@implementation NibwareNibUtils


+ (UITableViewCell*) loadReusableCell:(NSString*)cellid fromNib:(NSString *)nibName 
{ 
    NSArray* nibContents = [[NSBundle mainBundle] 
                            loadNibNamed:nibName owner:self options:nil]; 
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator]; 
    UITableViewCell* newcell = nil; 
    NSObject* nibItem = nil; 
    while ( (nibItem = [nibEnumerator nextObject]) != nil) { 
        if ( [nibItem isKindOfClass: [UITableViewCell class]]) { 
            newcell = (UITableViewCell*) nibItem; 
            if ([newcell.reuseIdentifier isEqual: cellid]) 
                break; // we have a winner 
            else 
                newcell = nil; 
        } 
    } 
    return newcell;
}

+ (UITableViewCell*) loadNewCellfromNib:(NSString *)nibName 
{ 
    NSArray* nibContents = [[NSBundle mainBundle] 
                            loadNibNamed:nibName owner:self options:nil]; 
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator]; 
    NSObject* nibItem = nil; 
    while ( (nibItem = [nibEnumerator nextObject]) != nil) { 
        if ( [nibItem isKindOfClass:[UITableViewCell class]]) { 
            return (UITableViewCell*) nibItem;
        } 
    } 
    return nil; 
} 

@end
