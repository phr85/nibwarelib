//
//  PingleUrlUtils.h
//  pingle
//
//  Created by Robert Sanders on 9/17/08.
//  Copyright 2008 ViTrue, Inc.. All rights reserved.
//

@protocol NibwareOutputStream;

@interface NibwareUrlUtils : NSObject {

}


+ (NSString *) urlencode:(NSString *)string;

+ (NSString *) urldecode:(NSString *)string;

+ (NSDictionary *) parseQueryString:(NSString *)queryString;


+ (NSInteger) dictToQuery:(NSDictionary *)dict outputStream:(id<NibwareOutputStream>)output;

+ (NSString *) dictToQueryString:(NSDictionary *)dict;
+ (NSData *) dictToQueryData:(NSDictionary *)dict;
+ (NSInteger) dictToQueryFile:(NSDictionary *)dict path:(NSString *)name;

+ (void)setMIMEBody:(NSMutableURLRequest *)request withParts:(NSArray *)parts;

@end

