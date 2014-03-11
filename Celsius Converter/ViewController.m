//
//  ViewController.m
//  Celsius Converter
//
//  Created by Mario Grimaldi on 11/03/14.
//  Copyright (c) 2014 Mario. All rights reserved.
//

#import "ViewController.h"
#define KELVIN_ZERO 273.15

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBar.delegate = self;
    _temperatureTextField.delegate = self; // for keyboard dismiss
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Conversion methods

- (IBAction)convertTemperature
{
    // input temperature validation
    // checks that is a valid number and a non empty string
    if (![self isValidTemperature:_temperatureTextField.text]) {
        
        // Show error and return
        //_temperatureTextField.text = @"Error";
        UIAlertView *alertError = [[UIAlertView alloc] initWithTitle:@"Errore"
                                                             message:@"Temperatura inserita, non valida. Riprovare"
                                                            delegate:self
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil, nil];
        [alertError show];
        return;
        
    }
    
    // valid temperature, proceed to convert and print the result
    double kelvinTemperature = [_temperatureTextField.text doubleValue];
    double celsiusTemperature = kelvinTemperature - 273.15;
    
    _resultLabel.text = [NSString stringWithFormat:@"%.2f °C", celsiusTemperature];
}

// Utility method to check valid temperature
- (BOOL)isValidTemperature:(NSString *)temperatureString
{
    // Number formatter to check if string is a number
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setAllowsFloats:YES];
    
    // True conditions in OR
    // Note that numberFromString method returns nil if fails
    // to parse a valid number.
    return  temperatureString.length > 0 &&
            [numberFormatter numberFromString:temperatureString] != nil;
    
}

// Clear input when error alert is dismissed
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    _temperatureTextField.text = @"";
}


#pragma mark Methods to dismiss keyboard when needed

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_temperatureTextField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


#pragma mark Tab bar events

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item.tag == 0) { // history
        NSLog(@"touched history");
        // TODO - show history view ;)
    }
}

@end
