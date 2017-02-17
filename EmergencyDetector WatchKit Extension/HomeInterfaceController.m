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
    
    
//    CMMotionManager *motionMgr = [[CMMotionManager alloc] init];
//    NSString *status = @"";
//    if([motionMgr isAccelerometerAvailable])
//        status = [status stringByAppendingString:@"A"];
//    if([motionMgr isGyroAvailable])
//        status = [status stringByAppendingString:@"G"];
//    if([motionMgr isMagnetometerAvailable])
//        status = [status stringByAppendingString:@"M"];
//    if([motionMgr isDeviceMotionAvailable])
//        status = [status stringByAppendingString:@"D"];
//    
//    [self.statusLbl setText:status];
}

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
//    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Silent"}
//                               replyHandler:^(NSDictionary *reply) {
//                                   
//                               }
//                               errorHandler:^(NSError *error) {
//                                   
//                               }
//     ];
    NSDictionary *applicationDict = @{@"alertType":@"Silent"};
 //   [[WCSession defaultSession] updateApplicationContext:applicationDict error:nil];
    [[WCSession defaultSession] transferUserInfo:applicationDict];
    [self moveToAlert:@"Silent"];
    
}

-(void)moveToAlert:(NSString *)alertType
{
  [self presentControllerWithName:@"Alert" context:alertType];
}



//-(void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext
//{
//    NSLog(@"Through Update Context");
//     [self moveToAlert:applicationContext[@"alertType"]];
//}
//-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
//{
//    NSLog(@"Through Message");
//    [self moveToAlert:message[@"alertType"]];
//}
@end



