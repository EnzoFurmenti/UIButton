//
//  CustomLabel.h
//  UIButton
//
//  Created by EnzoF on 07.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabel : UILabel


@property (nonatomic, assign) IBInspectable CGFloat leftEdge;
@property (nonatomic, assign) IBInspectable CGFloat rightEdge;
@property (nonatomic, assign) IBInspectable CGFloat topEdge;
@property (nonatomic, assign) IBInspectable CGFloat bottomEdge;

@property (nonatomic, assign) UIEdgeInsets edgeInsets;


@end
