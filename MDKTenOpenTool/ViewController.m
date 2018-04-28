//
//  ViewController.m
//  MDKTenOpenTool
//
//  Created by mikun on 2018/4/28.
//  Copyright © 2018年 mdk. All rights reserved.
//

#import "ViewController.h"
#import "MDKTenOpenTool.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)clickBtn:(UIButton *)sender{
	switch (sender.tag) {
		case 1:
			[MDKTenOpenTool openCamera];
			break;
		case 2:
			[MDKTenOpenTool openPhotos];
			break;
		case 3:
			[MDKTenOpenTool openMicrophone];
			break;
		case 4:
			[MDKTenOpenTool openContact];
			break;
		case 5:
			[MDKTenOpenTool openLocation];
			break;
		default:
			break;
	}
}


@end
