//
//  ViewController.m
//  iOS10-APOD
//
//  Created by Paul Solt on 12/19/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSIImageOperation.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic) NSOperationQueue *imageQueue;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// TODO: Move this to init
	_imageQueue = [[NSOperationQueue alloc] init];
	
	
	// Download image
	NSURL *url = [NSURL URLWithString:@"https://apod.nasa.gov/apod/image/1912/AS17-149-22859-2v2SmlWmk1024.jpg"];
	
	
	LSIImageOperation *imageOperation = [[LSIImageOperation alloc] initWithImageURL:url];
	
	
	NSBlockOperation *updateUI = [NSBlockOperation blockOperationWithBlock:^{
		NSLog(@"Update the UI");
		self.imageView.image = imageOperation.image;
	}];

	[updateUI addDependency:imageOperation];
	
	[self.imageQueue addOperation:imageOperation];
	[[NSOperationQueue mainQueue] addOperation:updateUI];
	
}



@end
