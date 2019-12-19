//
//  LSIPhoto.h
//  iOS10-APOD
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIPhoto : NSObject

//@property NSString *copyright;
//@property NSDate *date;
//@property NSString *explanation;
//@property NSURL *hdURL;
@property NSString *title;
@property NSURL *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end

NS_ASSUME_NONNULL_END
