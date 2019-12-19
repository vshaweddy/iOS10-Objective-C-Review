//
//  iOS10_APODTests.m
//  iOS10-APODTests
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

NSData *loadFile(NSString *filename, NSBundle *bundle) {
	NSString *basename = [filename stringByDeletingPathExtension];
	NSString *extension = [filename pathExtension];
	
	NSString *path = [bundle pathForResource:basename ofType:extension];
	NSData *data = [NSData dataWithContentsOfFile:path];
	return data;
}

@interface iOS10_APODTests : XCTestCase

@end

@implementation iOS10_APODTests

- (void)testPhotoJSON {
	
	NSBundle *testBundle = [NSBundle bundleForClass:[self class]];
	NSData *jsonPhotoData = loadFile(@"Photo.json", testBundle);
	
	NSError *error = nil;
	NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonPhotoData options:0 error:&error];
	
	if (error) {
//		NSLog(@"Error: %@", error);
		XCTFail(@"Error: %@", error);
	}
	
	NSLog(@"JSON: %@", dictionary);
	// TODO: Parse the JSON dictionary
	
}


@end
