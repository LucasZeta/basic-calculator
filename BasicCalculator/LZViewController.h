//
//  LZViewController.h
//  BasicCalculator
//
//  Created by Lucas de Souza da Conceição on 26/10/13.
//  Copyright (c) 2013 Lucas de Souza da Conceição. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZOperation.h"
#import "LZSum.h"
#import "LZSubtraction.h"
#import "LZMultiplication.h"
#import "LZDivision.h"

@interface LZViewController : UIViewController
{
    IBOutlet UILabel *resultScreen;

    NSMutableString *numberTapped;
    double total;

    id<LZOperation> operation;
}

- (IBAction)tapNumber:(id)sender;
- (IBAction)tapDecimalSeparator:(id)sender;
- (IBAction)clearCalculator:(id)sender;
- (IBAction)divide:(id)sender;
- (IBAction)multiplicate:(id)sender;
- (IBAction)subtract:(id)sender;
- (IBAction)sum:(id)sender;

@end
