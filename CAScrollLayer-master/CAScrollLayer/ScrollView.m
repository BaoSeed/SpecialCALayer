//
//  ScrollView.m
//  CAScrollLayer
//
//  Created by 朱鹏的Mac on 16/2/29.
//  Copyright © 2016年 朱鹏的Mac. All rights reserved.
//

#import "ScrollView.h"

//参考链接
//https://zsisme.gitbooks.io/ios-/content/chapter6/cascrollLayer.html

@implementation ScrollView

+ (Class)layerClass
{
    return [CAScrollLayer class];
}

- (void)setUp
{
    self.layer.masksToBounds = YES;
    
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:recognizer];
}

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib {

    [self setUp];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{

    CGPoint offset = self.bounds.origin;
    offset.x -= [recognizer translationInView:self].x;
    offset.y -= [recognizer translationInView:self].y;
    

    [(CAScrollLayer *)self.layer scrollToPoint:offset];
    //- (void)scrollRectToVisible:(CGRect)r;
   // @property(readonly) CGRect visibleRect;

    [recognizer setTranslation:CGPointZero inView:self];
    
}


@end
