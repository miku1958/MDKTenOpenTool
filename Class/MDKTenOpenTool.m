//
//  MDKTenOpenTool.m
//
//  Created by mikun on 2017/8/18.
//  Copyright © 2017年 MDK. All rights reserved.
//

#import "MDKTenOpenTool.h"
#import <CoreLocation/CoreLocation.h>

@implementation MDKTenOpenTool
+(void)openURL:(NSString *)urlstr{
	[self openURL:urlstr forceOpenInEleven:NO];
}
	
+ (void)openURL:(NSString *)urlstr forceOpenInEleven:(BOOL)forceOpenInEleven{

    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];//iOS11只能跳这个
    if (UIDevice.currentDevice.systemVersion.doubleValue<10.0) {/*1-9*/
        url = [NSURL URLWithString:urlstr];
    }else if(UIDevice.currentDevice.systemVersion.doubleValue<11.0 || forceOpenInEleven){/*10*/
		url = [NSURL URLWithString:[urlstr stringByReplacingOccurrencesOfString:@"prefs" withString:@"App-Prefs"]];
	}
    
    if ([UIApplication.sharedApplication canOpenURL:url]) {
		if ([UIApplication.sharedApplication respondsToSelector:@selector(openURL:options:completionHandler:)]) {
			[UIApplication.sharedApplication openURL:url options:@{} completionHandler:^(BOOL success) {
				
			}];
		}else{
			[UIApplication.sharedApplication openURL:url];
		}
    }
}
+(void)openCamera{ [self openURL:@"prefs:root=Privacy&path=CAMERA"]; }

+ (void)openPhotos{ [self openURL:@"prefs:root=Privacy&path=PHOTOS"]; }

+(void)openMicrophone{ [self openURL:@"prefs:root=Privacy&path=MICROPHONE"]; }

+ (void)openContact{ [self openURL:@"prefs:root=Privacy&path=CONTACTS"]; }

+ (void)openLocation{
	if (![CLLocationManager locationServicesEnabled]) {
		[self openLocationServicesDisable];
		return;
	}

	CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
	switch (status) {
		case kCLAuthorizationStatusDenied:
			[self openURL:@"prefs:root=LOCATION_SERVICES"];
		default:
			break;
	}
}

+ (void)openLocationServicesDisable{
	NSString *url;
	if (UIDevice.currentDevice.systemVersion.doubleValue<10.0) {
		url = @"prefs:root=LOCATION_SERVICES";
	}else{
		url = @"prefs:root=Privacy";
	}
	[self openURL:url forceOpenInEleven:YES];
}

@end
