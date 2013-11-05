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

- (IBAction)tapKey:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    [numberTapped appendString:button.titleLabel.text];

    [self updateResultScreen:numberTapped];
}

- (IBAction)clearCalculator:(id)sender
{
    numberTapped = [NSMutableString stringWithString:@""];
    total = 0;

    operation = nil;

    [self updateResultScreen];
}

- (void)updateResultScreen
{
    [self updateResultScreen:[NSString stringWithFormat:@"%f", total]];
}

- (void)updateResultScreen:(NSString *)text
{
    resultScreen.text = text;
}

- (IBAction)divide:(id)sender
{
    [self calculate];
    operation = [[LZDivision alloc] init];
}

- (IBAction)multiplicate:(id)sender
{
    [self calculate];
    operation = [[LZMultiplication alloc] init];
}

- (IBAction)subtract:(id)sender
{
    [self calculate];
    operation = [[LZSubtraction alloc] init];
}

- (IBAction)sum:(id)sender
{
    [self calculate];
    operation = [[LZSum alloc] init];
}

- (void)calculate
{
    float number = [numberTapped floatValue];

    if (operation) {
        total = [operation doTheMathWith:total and:number];

        [self updateResultScreen];
    } else {
        total = number;
    }

    numberTapped = [NSMutableString stringWithString:@""];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    total = 0;
    numberTapped = [NSMutableString stringWithString:@""];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
