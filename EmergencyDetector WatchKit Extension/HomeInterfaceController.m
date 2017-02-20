//
//  HomeInterfaceController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "HomeInterfaceController.h"


@interface HomeInterfaceController ()
@end

@implementation HomeInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
   // [self checkHardwareAvailablability];
}
//-(void)checkHardwareAvailablability
//{
//    _motionMgr = [[CMMotionManager alloc] init];
//    if ([_motionMgr isDeviceMotionAvailable]) {
//        _motionMgr.showsDeviceMovementDisplay = YES;
//        _motionMgr.deviceMotionUpdateInterval = 0.01;
//        [_motionMgr startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error)
//         {
//             double accelerationX = motion.gravity.x + motion.userAcceleration.x;
//             double accelerationY = motion.gravity.y + motion.userAcceleration.y;
//             double accelerationZ = motion.gravity.z + motion.userAcceleration.z;
//             double totalAcceleration = sqrt((accelerationX * accelerationX) + (accelerationY * accelerationY) + (accelerationZ * accelerationZ));
//             
//             if (totalAcceleration > 6.0) {
//                 NSLog(@"Free Fall");
//             }
//             else
//             {
//                 NSLog(@"Value = %f",totalAcceleration);
//             }
//         }];
//    }
//}
- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)emergencyAlertClicked
{
//    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Emergency"}
//                               replyHandler:^(NSDictionary *reply) {
//                                   
//                               }
//                               errorHandler:^(NSError *error) {
//                                  
//                               }
//     ];
    NSDictionary *applicationDict = @{@"alertType":@"Emergency"};
   // [[WCSession defaultSession] updateApplicationContext:applicationDict error:nil];
   [[WCSession defaultSession] transferUserInfo:applicationDict];
    [self moveToAlert:@"Emergency"];
    }


- (IBAction)silentAlertClicked
{

    NSDictionary *applicationDict = @{@"alertType":@"Silent"};
 //   [[WCSession defaultSession] updateApplicationContext:applicationDict error:nil];
    [[WCSession defaultSession] transferUserInfo:applicationDict];
    [self moveToAlert:@"Silent"];
    
}

-(void)moveToAlert:(NSString *)alertType
{
  [self presentControllerWithName:@"Alert" context:alertType];
}

@end



