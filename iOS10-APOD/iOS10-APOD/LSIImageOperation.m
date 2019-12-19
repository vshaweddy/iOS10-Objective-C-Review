//
//  LSIImageOperation.m
//  iOS10-APOD
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIImageOperation.h"

@implementation LSIImageOperation


- (instancetype)initWithImageURL:(NSURL *)imageURL {
	self = [super init];
	if (self) {
		_imageURL = imageURL;
	}
	return self;
}

- (void)main {
	NSLog(@"Downloading image: %@", self.imageURL);
	NSError *error = nil; // always set the error to nil, before passing it to a
						// function that can fail
	NSData *imageData = [NSData dataWithContentsOfURL:self.imageURL options:0 error:&error];
	
	if (error) {
		NSLog(@"LSIImageOperation Error: %@", error);
		return; // early exit
	}
	
	self.image = [UIImage imageWithData:imageData];
	NSLog(@"Downloaded image: %@", self.image);
}

@end
