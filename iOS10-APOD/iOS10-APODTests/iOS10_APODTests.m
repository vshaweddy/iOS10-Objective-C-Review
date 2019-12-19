//
//  iOS10_APODTests.m
//  iOS10-APODTests
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LSIPhoto.h"

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
	
	
//	"title": "Starburst Galaxy M94 from Hubble",
//	"url": "https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg"
	
	NSURL *expectedURL = [NSURL URLWithString:@"https://apod.nasa.gov/apod/image/1912/M94_Hubble_960.jpg"];
	NSURL *expectedHdURL = [NSURL URLWithString:@"https://apod.nasa.gov/apod/image/1912/M94_Hubble_1002.jpg"];
	NSString *explanation = @"Why does this galaxy have a ring of bright blue stars?  Beautiful island universe Messier 94 lies a mere 15 million light-years distant in the northern constellation of the Hunting Dogs (Canes Venatici). A popular target for Earth-based astronomers, the face-on spiral galaxy is about 30,000 light-years across, with spiral arms sweeping through the outskirts of its broad disk. But this Hubble Space Telescope field of view spans about 7,000 light-years across M94's central region. The featured close-up highlights the galaxy's compact, bright nucleus, prominent inner dust lanes, and the remarkable bluish ring of young massive stars. The ring stars are all likely less than 10 million years old, indicating that M94 is a starburst galaxy that is experiencing an epoch of rapid star formation from inspiraling gas. The circular ripple of blue stars is likely a wave propagating outward, having been triggered by the gravity and rotation of a oval matter distributions. Because M94 is relatively nearby, astronomers can better explore details of its starburst ring.    Astrophysicists: Browse 2,000+ codes in the Astrophysics Source Code Library";

	LSIPhoto *photo = [[LSIPhoto alloc] initWithDictionary: dictionary];
	
//TODO: Date
	
	XCTAssertEqualObjects(@"Starburst Galaxy M94 from Hubble", photo.title);
	XCTAssertEqualObjects(expectedURL, photo.url);
	XCTAssertEqualObjects(expectedHdURL, photo.hdURL);
	XCTAssertEqualObjects(explanation, photo.explanation);
//	XCTAssertEqualObjects(date, photo.date);
	XCTAssertEqualObjects(@"ESA/HubbleNASA", photo.copyright);
	
	
}

@end
