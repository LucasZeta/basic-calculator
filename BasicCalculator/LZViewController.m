//
//  LZViewController.m
//  BasicCalculator
//
//  Created by Lucas de Souza da Conceição on 26/10/13.
//  Copyright (c) 2013 Lucas de Souza da Conceição. All rights reserved.
//

#import "LZViewController.h"

@interface LZViewController ()

@end

@implementation LZViewController

- (IBAction)tapNumber:(id)sender
{
    UIButton *button = (UIButton *)sender;
    int intValue = [button.titleLabel.text intValue];

    if (decimalPlaces > 0) {
        [self insertNumberAtFractionalPart:intValue];
    } else {
        [self insertNumberAtIntegerPart:intValue];
    }

    [self putButtonNumberOnScreen];
}

- (IBAction)tapDecimalSeparator:(id)sender
{
    if (decimalPlaces == 0) {
        decimalPlaces = 1;
    }
}

- (void)putButtonNumberOnScreen
{
    int precision = (decimalPlaces > 0) ? decimalPlaces - 1 : 0;
    resultScreen.text = [NSString stringWithFormat:@"%.*f", precision, numberTapped];
}

- (void)insertNumberAtIntegerPart:(int)number
{
    numberTapped *= 10;
    numberTapped += number;
}

- (void)insertNumberAtFractionalPart:(int)number
{
    numberTapped += number / pow(10.0f, decimalPlaces);
    decimalPlaces++;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
