//
//  MDKTenOpenTool.h
//
//  Created by mikun on 2017/8/18.
//  Copyright © 2017年 MDK. All rights reserved.
//

@import UIKit;

@interface MDKTenOpenTool : NSObject

///跳转到相机权限
+ (void)openCamera;
///跳转到相册权限
+ (void)openPhotos;
///跳转到麦克风权限
+ (void)openMicrophone;
///跳转到联系人
+ (void)openContact;
///跳转到定位,如果是没打开定位功能则跳转到打开定位
+ (void)openLocation;

+ (void)openURL:(NSString*)urlstr;
///如果forceOpenInEleven为YES,则不会自动跳转到UIApplicationOpenSettingsURLString
+ (void)openURL:(NSString *)urlstr forceOpenInEleven:(BOOL)forceOpenInEleven;
@end
