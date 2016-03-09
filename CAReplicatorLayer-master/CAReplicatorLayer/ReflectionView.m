//
//  ReflectionView.m
//  CAReplicatorLayer
//
//  Created by 朱鹏的Mac on 16/2/29.
//  Copyright © 2016年 朱鹏的Mac. All rights reserved.
//

#import "ReflectionView.h"

#define reflectionGap     10    //镜像间隔
#define reflectionAlpha   -0.1  //透明度递减值

@implementation ReflectionView

+ (Class)layerClass{
 
    return [CAReplicatorLayer class];
}

- (void)reflect{

    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.shouldRasterize = YES;
    layer.rasterizationScale = [UIScreen mainScreen].scale;
    layer.instanceCount = 2;  //重复图层个数
    
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0.0f, layer.bounds.size.height + reflectionGap, 0.0f);
    transform = CATransform3DScale(transform, 1.0f, -1.0f, 0.0f);
    
    layer.instanceTransform = transform;
    layer.instanceAlphaOffset = reflectionAlpha;
    //layer.instanceBlueOffset = -0.1;
    //layer.instanceGreenOffset = -0.1;
}


- (void)awakeFromNib{
  
    [self reflect];
}
@end
