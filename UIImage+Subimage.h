//
//  UIImage+Subimage.h
//  pingle
//
//  Created by robertsanders on 4/30/09.
//  Copyright 2009 Robert Sanders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NibwareUIImage : UIImage {
    UIImageOrientation     forcedOrientation;
    BOOL                   hasForcedOrientation;
}

@property (assign) UIImageOrientation     forcedOrientation;
@property (assign) BOOL                   hasForcedOrientation;
@end


@interface UIImage(Subimage)

- (UIImage*)subImageInRect:(CGRect)rect;
- (CGAffineTransform) transformForOrientation;
- (UIImage*) imageWithoutOrientation;

@end
