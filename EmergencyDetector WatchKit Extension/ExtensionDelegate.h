//
//  ExtensionDelegate.h
//  EmergencyDetector WatchKit Extension
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <HealthKit/HealthKit.h>

@interface ExtensionDelegate : NSObject <WKExtensionDelegate,WCSessionDelegate,HKWorkoutSessionDelegate>

@end
