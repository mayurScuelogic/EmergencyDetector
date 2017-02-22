//
//  AlertViewController.m
//  EmergencyDetector
//
//  Created by Cuelogic on 14/02/17.
//  Copyright © 2017 Com. All rights reserved.
//

#import "AlertViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface AlertViewController ()
{

    IBOutlet UILabel *alertTypeLbl;
    
    IBOutlet UIImageView *alertImage;
    AVAudioPlayer * audioPlayer;
}
@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [alertTypeLbl setText:self.alertType];
    NSString *path = [NSString stringWithFormat:@"%@/alarm.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];

    if ([self.alertType isEqualToString:@"Emergency"]) {
        [alertImage setImage:[UIImage imageNamed:@"alert-thumb-slider.png"]];
        [audioPlayer play];
    }
    else
    {
        [alertImage setImage:[UIImage imageNamed:@"silent-1.png"]];
    }
    
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if ([audioPlayer isPlaying]) {
        [audioPlayer stop];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelClicked:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
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
