//
//  LSIImageOperation.h
//  iOS10-APOD
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIImageOperation : NSOperation

@property NSURL *imageURL;
@property UIImage *image;	// image updates after finishing

- (instancetype)initWithImageURL:(NSURL *)imageURL;

@end

NS_ASSUME_NONNULL_END
