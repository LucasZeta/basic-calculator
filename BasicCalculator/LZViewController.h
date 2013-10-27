//
//  LZViewController.h
//  BasicCalculator
//
//  Created by Lucas de Souza da Conceição on 26/10/13.
//  Copyright (c) 2013 Lucas de Souza da Conceição. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZViewController : UIViewController
{
    IBOutlet UILabel *resultScreen;

    double numberTapped;
    double total;
    int decimalPlaces;
}

- (IBAction)tapNumber:(id)sender;
- (IBAction)tapDecimalSeparator:(id)sender;

@end
