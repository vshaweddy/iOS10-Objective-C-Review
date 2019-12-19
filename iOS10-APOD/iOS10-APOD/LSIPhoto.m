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
		NSString *urlString = dictionary[@"url"];
		NSString *hdURLString = dictionary[@"hdurl"];
		NSString *explanation = dictionary[@"explanation"];
		NSDate *date = dictionary[@"date"];
		NSString *copyright = dictionary[@"copyright"];
		
		// try to construct (potentially return nil if missing fields)
		if (title && urlString && hdURLString && explanation && date && copyright) {
			_title = title;
			_url = [NSURL URLWithString:urlString];
			_hdURL = [NSURL URLWithString:hdURLString];
			_explanation = explanation;
//			_date = NSDate
			_copyright = copyright;
		}
		
	}
	return self;
}


@end
