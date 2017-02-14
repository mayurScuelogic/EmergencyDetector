//
//  HomeInterfaceController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "HomeInterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>
@interface HomeInterfaceController ()<WCSessionDelegate>

@end

@implementation HomeInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (IBAction)emergencyAlertClicked
{
    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Emergency"}
                               replyHandler:^(NSDictionary *reply) {
                                   
                               }
                               errorHandler:^(NSError *error) {
                                  
                               }
     ];
    [self moveToAlert:@"Emergency"];
    }


- (IBAction)silentAlertClicked
{
    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Silent"}
                               replyHandler:^(NSDictionary *reply) {
                                   
                               }
                               errorHandler:^(NSError *error) {
                                   
                               }
     ];
    [self moveToAlert:@"Silent"];
    
}

-(void)moveToAlert:(NSString *)alertType
{
  [self presentControllerWithName:@"Alert" context:alertType];
}


-(void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error
{
    NSLog(@"%ld",(long)activationState);
}
-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    [self moveToAlert:message[@"alertType"]];
}
@end



