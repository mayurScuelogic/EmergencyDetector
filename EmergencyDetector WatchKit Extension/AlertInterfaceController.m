//
//  AlertInterfaceController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "AlertInterfaceController.h"

@interface AlertInterfaceController ()
{
     NSString *alertType;
    WKAudioFilePlayer *audioFilePlayer;
}
@end

@implementation AlertInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    alertType = [NSString stringWithString:context];
//    NSURL *assetURL = [[NSBundle mainBundle] URLForResource:@"alarm" withExtension:@"mp3"];
//    WKAudioFileAsset *asset = [WKAudioFileAsset assetWithURL:assetURL];
//    WKAudioFilePlayerItem *playerItem = [WKAudioFilePlayerItem playerItemWithAsset:asset];
//    audioFilePlayer = [WKAudioFilePlayer playerWithPlayerItem:playerItem];
    [_alertTypeLbl setText:alertType];
    if ([alertType isEqualToString:@"Emergency"]) {
        [_alertImage setImageNamed:@"alert-thumb-slider.png"];
      //  [audioFilePlayer play];
    }
    else
    {
        
        [_alertImage setImageNamed:@"silent.png"];
    }

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeNotification];
   }

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



