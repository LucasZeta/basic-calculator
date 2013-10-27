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

    numberTapped *= 10;
    numberTapped += [button.titleLabel.text doubleValue];

    [self putButtonNumberOnScreen];
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

        [self updateResultScreen];
    } else {
        total = numberTapped;
    }

    numberTapped = 0;
}

- (void)updateResultScreen
{
    resultScreen.text = [NSString stringWithFormat:@"%f", total];
}

- (void)putButtonNumberOnScreen
{
    resultScreen.text = [NSString stringWithFormat:@"%f", numberTapped];
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
