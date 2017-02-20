//
//  HomeViewController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "HomeViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import <CoreLocation/CoreLocation.h>
#import  <CoreMotion/CoreMotion.h>
#import "AlertViewController.h"
@import UserNotifications;
@interface HomeViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *locManager;
    CMMotionManager * motionMgr;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    locManager = [[CLLocationManager alloc]init];
    [locManager setDelegate:self];
    [locManager requestAlwaysAuthorization];
    [locManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locManager setAllowsBackgroundLocationUpdates:YES];
    [locManager startUpdatingLocation];
    [self checkHardwareAvailablability];
        // Do any additional setup after loading the view.
}
//- (BOOL)canBecomeFirstResponder {
//    return YES;
//}
//
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    [self becomeFirstResponder];
//}
//-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    NSLog(@"Motion Began %@",event);
//}
-(void)checkHardwareAvailablability
{
    motionMgr = [[CMMotionManager alloc] init];
    if ([motionMgr isDeviceMotionAvailable]) {
    motionMgr.showsDeviceMovementDisplay = YES;
    motionMgr.deviceMotionUpdateInterval = 0.01;
    [motionMgr startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error)
        {
            double accelerationX = motion.gravity.x + motion.userAcceleration.x;
            double accelerationY = motion.gravity.y + motion.userAcceleration.y;
            double accelerationZ = motion.gravity.z + motion.userAcceleration.z;
            double totalAcceleration = sqrt((accelerationX * accelerationX) + (accelerationY * accelerationY) + (accelerationZ * accelerationZ));
            
            if (totalAcceleration > 4.0) {
                NSLog(@"Free Fall");
            }
            else
            {
                NSLog(@"Value = %f",totalAcceleration);
            }
    }];
    }

}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)moveToAlert:(NSString *)alertType
{
    AlertViewController * alert = [self.storyboard instantiateViewControllerWithIdentifier:@"AlertViewController"];
    alert.alertType = alertType;
    [self presentViewController:alert animated:YES completion:nil];

}
- (IBAction)emergencyAlertGenerated:(id)sender
{
//    if ([[WCSession defaultSession] isReachable]) {
//    NSDictionary *applicationDict = @{@"alertType":@"Emergency"};
//    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Emergency"}
//                               replyHandler:^(NSDictionary *reply) {
//                                   
//                               }
//                               errorHandler:^(NSError *error){
//                                [[WCSession defaultSession] updateApplicationContext:applicationDict error:nil];
//                               }
//     ];
//    }
    NSDictionary *applicationDict = @{@"alertType":@"Emergency"};
     [[WCSession defaultSession] transferUserInfo:applicationDict];
    [self moveToAlert:@"Emergency"];
}
- (IBAction)silentAlertGenerated:(id)sender
{
    NSDictionary *applicationDict = @{@"alertType":@"Silent"};
    [[WCSession defaultSession] transferUserInfo:applicationDict];
     [self moveToAlert:@"Silent"];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    //NSLog(@"%@",[locations lastObject]);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
