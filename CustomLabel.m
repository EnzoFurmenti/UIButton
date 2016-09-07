//
//  CustomLabel.m
//  UIButton
//
//  Created by EnzoF on 07.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "CustomLabel.h"

@implementation CustomLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.edgeInsets = UIEdgeInsetsMake(self.topEdge, self.leftEdge, self.bottomEdge, self.rightEdge);
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect
{
    self.edgeInsets = UIEdgeInsetsMake(self.topEdge, self.leftEdge, self.bottomEdge, self.rightEdge);
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.edgeInsets)];
}

//- (CGSize)intrinsicContentSize
//{
//    CGSize size = [super intrinsicContentSize];
//    size.width  += self.edgeInsets.left + self.edgeInsets.right;
//    size.height += self.edgeInsets.top + self.edgeInsets.bottom;
//    return size;
//}
@end
