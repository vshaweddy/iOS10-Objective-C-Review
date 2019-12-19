//
//  LSIPhoto.m
//  iOS10-APOD
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIPhoto.h"

@implementation LSIPhoto


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	self = [super init];
	if(self) {
		
		// try to find all values
		NSString *title = dictionary[@"title"];
		NSString *stringURL = dictionary[@"url"];
		NSURL *url = [NSURL URLWithString:stringURL];
		
		// try to construct (potentially return nil if missing fields)
		if (title && url) {
			_title = title;
			_url = url;
		}
		
	}
	return self;
}


@end
