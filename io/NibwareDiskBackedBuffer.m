//
//  NibwareDiskBackedBuffer.m
//  pingle
//
//  Created by robertsanders on 5/24/09.
//  Copyright 2009 Robert Sanders. All rights reserved.
//

#import "NibwareDiskBackedBuffer.h"
#import "NibwareFileManager.h"
#import "NWMappedFileData.h"
#import "NWMappedFileString.h"
#import "NibwareDataOutputStream.h"
#import "NibwareFileOutputStream.h"
#import "NibwareDataInputStream.h"

@implementation NibwareDiskBackedBuffer

@synthesize maxSize = _maxSize, written = _written;

- (id) initWithMaxSize:(NSUInteger)max capacity:(NSUInteger)cap
{
    self = [super init];
    _maxSize = max;
    _output = [[NibwareDataOutputStream alloc] initWithData:[NSMutableData dataWithCapacity:cap]];
    _deleteWhenDone = YES;
    return self;
}

- (void) convertToFile
{
    if (_path || ! [_output isKindOfClass:[NibwareDataOutputStream class]]) return;

    _path = [[[NibwareFileManager singleton] makeTempFileName] retain];
    [[(NibwareDataOutputStream*)_output data] writeToFile:_path atomically:NO];
    
    NSFileHandle *fh = [NSFileHandle fileHandleForUpdatingAtPath:_path];
    [fh seekToEndOfFile];
    [_output close];
    [_output release];
    _output = [[NibwareFileOutputStream alloc] initWithFile:fh];
}

- (void) expandForCapacity:(NSInteger)length
{
    if (_maxSize > 0 && (_written + length) > _maxSize) {
        [self convertToFile];
    }
}
#pragma mark Output Stream methods

- (void) appendData:(NSData*)data
{
    if (! _output) {
        [NibwareIOException raise:@"OutputStreamClosed" format:@"Cannot write to output stream after input stream created"];
    }

    [self expandForCapacity:[data length]];
    [_output appendData:data];
    _written += [data length];
}

- (void) appendBytes:(const void*)bytes length:(NSUInteger)length
{
    [self appendData:[NSData dataWithBytes:bytes length:length]];
}

- (void) appendString:(NSString*)string encoding:(NSStringEncoding)encoding
{
    [self appendData:[string dataUsingEncoding:encoding]];
}

- (void) appendObject:(id<NSCoding>)object
{
    [self appendData:[NSKeyedArchiver archivedDataWithRootObject:object]];
}

- (NSInteger) size
{
    return _written;
}

- (void) close
{
    [_output close];
}

#pragma mark NSData-like methods

// more methods mainly intended to mollify NSMutableData users

- (NSUInteger) length {
    return [_output length];
}

- (NSData *)subdataWithRange:(NSRange)range {
    return [_output subdataWithRange:range];
}

- (void)getBytes:(void *)buffer {
    [_output getBytes:buffer];
}

- (void)getBytes:(void *)buffer length:(NSUInteger)length {
    [_output getBytes:buffer length:length];
}

- (void)getBytes:(void *)buffer range:(NSRange)range {
    [_output getBytes:buffer range:range];
}

#pragma mark NSMutableData-like methods

- (void)increaseLengthBy:(NSUInteger)extraLength
{
    [_output increaseLengthBy:extraLength];
}

- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)bytes
{
    [_output replaceBytesInRange:range withBytes:bytes];
}

- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength
{
    [_output replaceBytesInRange:range withBytes:replacementBytes length:replacementLength];
}

- (void)resetBytesInRange:(NSRange)range
{
    [_output resetBytesInRange:range];
}

- (void)setData:(NSData *)aData
{
    [_output setData:aData];
}

- (void)setLength:(NSUInteger)length
{
    [_output setLength:length];
}


#pragma mark Input accessors

- (NSData*) inputData
{
    if (! _inputData)  {
        if (! _path) {
            _inputData = [[(NibwareDataOutputStream*)_output data] retain];
        } else {
            // flush and release filehandle
            [_output close];
            [_output release];
            _output = nil;
            
            _inputData = [[NWMappedFileData dataWithPath:_path deleteWhenDone:YES] retain];
            _deleteWhenDone = NO;
        }
    }
    return [[_inputData retain] autorelease];
}

- (id<NibwareInputStream>) inputStream
{
    if (! _inputStream)  {
        _inputStream = [[NibwareDataInputStream alloc] initWithData:[self inputData]];
    }
    return [[_inputStream retain] autorelease];
}

- (NSString*) inputString:(NSStringEncoding)encoding
{
    return [NWMappedFileString stringWithData:[self inputData] encoding:encoding];
}


#pragma mark cleanup

- (void) dealloc
{
    if (_deleteWhenDone && _path) {
        [[NSFileManager defaultManager] removeItemAtPath:_path error:nil];
    }
    [_path release];
    [_output release];
    [_inputStream release];
    [_inputData release];
    [super dealloc];
}

@end
