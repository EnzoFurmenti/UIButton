//
//  ViewController.h
//  UIButton
//
//  Created by EnzoF on 06.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrayButton
;




- (IBAction)actionButton:(UIButton *)sender;



@end

