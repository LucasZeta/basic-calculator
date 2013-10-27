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

    [self updateResultScreen];
}

- (IBAction)tapDecimalSeparator:(id)sender
{
    if (decimalPlaces == 0) {
        decimalPlaces = 1;
    }
}

- (IBAction)clearScreen:(id)sender
{
    decimalPlaces = 0;
    numberTapped = 0;
    total = 0;

    [self updateResultScreen];
}

- (void)updateResultScreen
{
    [self updateResultScreen:numberTapped];
}

- (void)updateResultScreen:(double)number
{
    int precision = (decimalPlaces > 0) ? decimalPlaces - 1 : 0;
    resultScreen.text = [NSString stringWithFormat:@"%.*f", precision, number];
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

- (IBAction)divide:(id)sender
{
    [self calculate];
    operation = [LZDivision sharedInstance];
}

- (IBAction)multiplicate:(id)sender
{
    [self calculate];
    operation = [LZMultiplication sharedInstance];
}

- (IBAction)subtract:(id)sender
{
    [self calculate];
    operation = [LZSubtraction sharedInstance];
}

- (IBAction)sum:(id)sender
{
    [self calculate];
    operation = [LZSum sharedInstance];
}

- (void)calculate
{
    if (operation) {
        total = [operation doTheMathWith:total and:numberTapped];

        [self updateResultScreen:total];
    } else {
        total = numberTapped;
    }

    numberTapped = 0;
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
