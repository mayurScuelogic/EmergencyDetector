//
//  HomeViewController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "HomeViewController.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import "AlertViewController.h"
@interface HomeViewController ()<WCSessionDelegate>

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([WCSession isSupported]) {
        WCSession *session = [WCSession defaultSession];
        session.delegate = self;
        [session activateSession];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
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
    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Emergency"}
                               replyHandler:^(NSDictionary *reply) {
                                   
                               }
                               errorHandler:^(NSError *error) {
                                   
                               }
     ];
    [self moveToAlert:@"Emergency"];
}
- (IBAction)silentAlertGenerated:(id)sender
{
    [[WCSession defaultSession] sendMessage:@{@"alertType":@"Silent"}
                               replyHandler:^(NSDictionary *reply) {
                                   
                               }
                               errorHandler:^(NSError *error) {
                                   
                               }
     ];
     [self moveToAlert:@"Silent"];
}
-(void)session:(WCSession *)session didReceiveMessage:(NSDictionary<NSString *,id> *)message replyHandler:(void (^)(NSDictionary<NSString *,id> * _Nonnull))replyHandler
{
    [self moveToAlert:message[@"alertType"]];
}
-(void)session:(WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(NSError *)error
{
    NSLog(@"%ld",(long)activationState);
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
