//
//  ViewController.m
//  UIButton
//
//  Created by EnzoF on 06.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "ViewController.h"
typedef enum{
    ViewControlleButtonOperand = 1,
    ViewControlleButtonMul = 10,
    ViewControlleButtonDiv = 20,
    ViewControlleButtonSqrt = 30,
    ViewControlleButtonPlus = 40,
    ViewControlleButtonEqual = 50,
    ViewControlleButtonPoint = 60,
    ViewControlleButtonUnarMinus = 70,
    ViewControlleButtonMinus = 90,
    ViewControlleButtonC= 100,
}ViewControlleButtonType;
@interface ViewController ()
@property (strong,nonatomic) UILabel *label;
@property (strong, nonatomic) NSString *currentOperand;
@property (assign,nonatomic) NSInteger  currentOperator;
@property (assign,nonatomic) BOOL isMidOperand;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isMidOperand = NO;
    self.currentOperand = nil;
    self.displayLabel.layer.cornerRadius = CGRectGetWidth(self.displayLabel.frame) / 16;
    self.displayLabel.layer.borderWidth = 3.f;
    self.displayLabel.layer.borderColor = [UIColor redColor].CGColor;
    for (UIButton *currentButton in self.arrayButton)
    {
        if(currentButton.tag == 1)
        {
            currentButton.layer.borderColor = [UIColor yellowColor].CGColor;
        }
        else
        {
            currentButton.layer.borderColor = [UIColor greenColor].CGColor;
        }
        currentButton.layer.cornerRadius = CGRectGetWidth(currentButton.frame) / 2;
        currentButton.layer.borderWidth = 3.f;
    }
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButton:(UIButton *)sender {
    switch (sender.tag) {
        case ViewControlleButtonOperand:
            [self appendOperand:sender.currentTitle];
            break;
        default:
            [self operation:sender.tag];
            break;
    }
    
    
}
- (void)appendOperand:(NSString*)operand{
    if(!self.isMidOperand)
    {
        if(![operand isEqualToString:@"0"] & ![operand isEqualToString:@"00"])
        {
            self.isMidOperand = YES;
            self.displayLabel.text = operand;
        }
    }
    else
    {
        self.displayLabel.text = [self.displayLabel.text stringByAppendingString:operand];
    }
}


- (void)appendPoint{
    if(![self.displayLabel.text containsString:@"-"])
    {
      self.displayLabel.text = [self.displayLabel.text stringByAppendingString:@"."];
    }
}


-(void)appendUnarMinus{
    NSMutableString *str  = [[NSMutableString alloc] initWithString:self.displayLabel.text];
    
    if([str containsString:@"-"])
    {
        NSRange range = NSMakeRange(0,1);

        [str deleteCharactersInRange:range];
    }
    else
    {
        if(str)
        {
            [str insertString:@"-" atIndex:0];
        }
    }
    self.displayLabel.text = str;
}

-(void)clear{
    self.currentOperand = nil;
    self.currentOperator = 0;
    self.isMidOperand = NO;
    self.displayLabel.text = @"0";
    
}

-(void)minus:(NSInteger)numberOperator{
    if(!self.currentOperand)
    {
        [self currentProperty:numberOperator];
    }
    else
    {
        CGFloat operand1Float = [self.currentOperand floatValue];
        CGFloat operand2Float = [self.displayLabel.text floatValue];
        CGFloat total = operand1Float - operand2Float;
        [self appendIntOrFloat:total];
        self.currentOperand = nil;
    }
    
}

-(void)multiplex:(NSInteger)numberOperator{
    if(!self.currentOperand)
    {
            [self currentProperty:numberOperator];
    }
    else
    {
        CGFloat operand1Float = [self.currentOperand floatValue];
        CGFloat operand2Float = [self.displayLabel.text floatValue];
        CGFloat total = operand1Float * operand2Float;
        [self appendIntOrFloat:total];
        self.currentOperand = nil;
    }
    self.isMidOperand = NO;
    
}

-(void)div:(NSInteger)numberOperator{
    if(!self.currentOperand)
    {
        [self currentProperty:numberOperator];
    }
    else
    {
        CGFloat operand1Float = [self.currentOperand floatValue];
        CGFloat operand2Float = [self.displayLabel.text floatValue];
        CGFloat total = operand1Float / operand2Float;
        [self appendIntOrFloat:total];
        self.currentOperand = nil;
    }
}

-(void)plus:(NSInteger)numberOperator{
    if(!self.currentOperand)
    {
        [self currentProperty:numberOperator];
    }
    else
    {
        CGFloat operand1Float = [self.currentOperand floatValue];
        CGFloat operand2Float = [self.displayLabel.text floatValue];
        CGFloat total = operand1Float + operand2Float;
        [self appendIntOrFloat:total];
        self.currentOperand = nil;
    }
}

-(void)sqrtOP{
    if([self.displayLabel.text floatValue] > 0)
    {
        CGFloat operandFloat = [self.displayLabel.text floatValue];
        CGFloat total = sqrtf(operandFloat);
        [self appendIntOrFloat:total];
    }
    else
    {
        self.displayLabel.text = @"0";
    }
    self.isMidOperand = NO;
    self.currentOperand = nil;
    
}

-(void)equal{
    if(self.displayLabel.text)
    {
        [self operation:self.currentOperator];
        
    }
    else
    {
        self.displayLabel.text = @"0";
    }

    self.isMidOperand = NO;
}

-(void)appendIntOrFloat:(CGFloat)number{
    CGFloat floatTotal = number;
    if(floatTotal - (int)number > 0.00001)
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%f",number];
    }
    else
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%d",(int)number];
    }
}

-(void)operation:(NSInteger)numberOperator{
    switch (numberOperator) {
        case ViewControlleButtonMul:
            [self multiplex:(NSInteger)numberOperator];
            break;
        case ViewControlleButtonDiv:
            [self div:(NSInteger)numberOperator];
            break;
        case ViewControlleButtonSqrt:
            [self sqrtOP];
            break;
            
        case ViewControlleButtonEqual:
            [self equal];
            break;
        case ViewControlleButtonPlus:
            [self plus:(NSInteger)numberOperator];
            break;
        case ViewControlleButtonPoint:
            [self appendPoint];
            
            break;
        case ViewControlleButtonUnarMinus:
            [self appendUnarMinus];
            
            break;
            
        case ViewControlleButtonC:
            [self clear];
            
            break;
        case ViewControlleButtonMinus:
            [self minus:(NSInteger)numberOperator];
            break;
    }
}

-(void)currentProperty:(NSInteger)numberOperator{
    self.isMidOperand = NO;
    self.currentOperand = self.displayLabel.text;
    self.displayLabel.text = @"0";
    self.currentOperator = numberOperator;
}

@end
