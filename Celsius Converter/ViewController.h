//
//  ViewController.h
//  Celsius Converter
//
//  Created by Mario Grimaldi on 11/03/14.
//  Copyright (c) 2014 Mario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
- (IBAction)convertTemperature;
@end
