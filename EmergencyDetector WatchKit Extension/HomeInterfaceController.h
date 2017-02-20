//
//  HomeInterfaceController.h
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <WatchConnectivity/WatchConnectivity.h>
#import <CoreMotion/CoreMotion.h>

@interface HomeInterfaceController : WKInterfaceController
@property(nonatomic,weak) IBOutlet WKInterfaceLabel *statusLbl;
@property(nonatomic,strong)CMMotionManager * motionMgr;

@end
