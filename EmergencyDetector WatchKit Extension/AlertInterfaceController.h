//
//  AlertInterfaceController.h
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface AlertInterfaceController : WKInterfaceController

@property(nonatomic,weak) IBOutlet WKInterfaceLabel *alertTypeLbl;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *alertImage;

@end
