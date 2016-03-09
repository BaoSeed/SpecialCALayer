//
//  ViewController.m
//  CAEmitterLayer
//
//  Created by 朱鹏的Mac on 16/2/29.
//  Copyright © 2016年 朱鹏的Mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self boomAnimation];

    [self snowAnimaiton];
}


- (void)snowAnimaiton{

    
    //创建雪花类型的粒子
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake.name = @"snow";
    //粒子参数的速度乘数因子
    snowflake.birthRate = 1.0;
    snowflake.lifetime = 120.0;
    //粒子速度
    snowflake.velocity =10.0;
    //粒子的速度范围
    snowflake.velocityRange = 10;
    //粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    //周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    //子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents = (id)[[UIImage imageNamed:@"灰色星星"] CGImage];
    //设置雪花形状的粒子的颜色
    snowflake.color = [[UIColor colorWithRed:0.200 green:0.258 blue:0.543 alpha:1.000] CGColor];
    
    
    
    //创建星星形状的粒子
    CAEmitterCell *snowflake1 = [CAEmitterCell emitterCell];
    //粒子的名字
    snowflake1.name = @"snow1";
    //粒子参数的速度乘数因子
    snowflake1.birthRate = 1.0;
    snowflake1.lifetime = 120.0;
    //粒子速度
    snowflake1.velocity =10.0;
    //粒子的速度范围
    snowflake1.velocityRange = 10;
    //粒子y方向的加速度分量
    snowflake1.yAcceleration = 2;
    //周围发射角度
    snowflake1.emissionRange = 0.5 * M_PI;
    //子旋转角度范围
    snowflake1.spinRange = 0.25 * M_PI;
    //粒子的内容和内容的颜色
    snowflake1.contents = (id)[[UIImage imageNamed:@"黄色星星"] CGImage];
    snowflake1.color = [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
    
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    //例子发射位置
    snowEmitter.emitterPosition = CGPointMake(self.view.frame.size.width  / 2.0,self.view.frame.size.height /2.0);
    //发射源的尺寸大小
    snowEmitter.emitterSize = CGSizeMake(20, 20);
    //发射模式
    snowEmitter.emitterMode =  kCAEmitterLayerSurface;
    
    //发射源的形状
    snowEmitter.emitterShape =  kCAEmitterLayerLine;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    //粒子边缘的颜色
    snowEmitter.shadowColor = [[UIColor redColor] CGColor];
    
    snowEmitter.emitterCells = [NSArray arrayWithObjects:snowflake,snowflake1,nil];
    [self.view.layer insertSublayer:snowEmitter atIndex:0];
}

- (void)boomAnimation{

    
    //create particle emitter layer
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height / 2.0);
    [self.view.layer addSublayer:emitter];
    
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    //emitter.preservesDepth
    //emitter.emitterSize
    //emitter.emitterShape
    //emitter.renderMode
    
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"黄色星星.png"].CGImage;
    cell.birthRate = 150;
    cell.lifetime = 5.0;
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
    cell.alphaSpeed = -0.4;
    cell.velocity = 50;
    cell.velocityRange = 50;
    cell.emissionRange = M_PI * 2.0; //发射角度范围
    emitter.emitterCells = @[cell];
}



/*
CAEmitterLayer和CAEmitterCell 的一些属性：

CAEmitterLayer 提供了一个基于 Core Animation 的粒子 发 射系 统 ，粒子用 CAEmitterCell 来初始化。 粒子画在背景 层 盒 边 界上

Properties:

birthRate: 粒子 产 生系数，默 认 1.0 ；

emitterCells:   装着 CAEmitterCell 对 象的数 组 ，被用于把粒子投放到 layer 上；

emitterDepth: 决定粒子形状的深度 联 系： emitter shape

emitterMode: 发 射模式

NSString * const kCAEmitterLayerPoints;

NSString * const kCAEmitterLayerOutline;

NSString * const kCAEmitterLayerSurface;

NSString * const kCAEmitterLayerVolume;

emitterPosition: 发 射位置

emitterShape: 发 射源的形状：

NSString * const kCAEmitterLayerPoint;

NSString * const kCAEmitterLayerLine;

NSString * const kCAEmitterLayerRectangle;

NSString * const kCAEmitterLayerCuboid;

NSString * const kCAEmitterLayerCircle;

NSString * const kCAEmitterLayerSphere;

emitterSize: 发 射源的尺寸大；

emitterZposition: 发 射源的 z 坐 标 位置；

lifetime: 粒子生命周期

preservesDepth: 不是多很清楚（粒子是平展在 层 上）

renderMode: 渲染模式：

NSString * const kCAEmitterLayerUnordered;

NSString * const kCAEmitterLayerOldestFirst;

NSString * const kCAEmitterLayerOldestLast;

NSString * const kCAEmitterLayerBackToFront;

NSString * const kCAEmitterLayerAdditive;

scale: 粒子的缩放比例：

seed ：用于初始化随机数产生的种子

spin: 自旋转速度

velocity ：粒子速度
 
 
 

CAEmitterCell

CAEmitterCell 类 代从从 CAEmitterLayer 射出的粒子； emitter cell 定 义 了粒子 发 射的方向。

alphaRange:    一个粒子的 颜 色 alpha 能改 变 的范 围 ；

alphaSpeed: 粒子透明度在生命周期内的改变速度；

birthrate ：粒子参数的速度乘数因子；

blueRange ：一个粒子的 颜 色 blue   能改 变 的范 围 ；

blueSpeed:   粒子 blue 在生命周期内的改变速度；

color: 粒子的颜色

contents ：是个 CGImageRef 的对象 , 既粒子要展现的图片；

contentsRect ：应该画在 contents 里的子 rectangle ：

emissionLatitude ：发射的 z 轴方向的角度

emissionLongitude:x-y 平面的 发 射方向

emissionRange ；周 围发射角度

emitterCells ：粒子发射的粒子

enabled ：粒子是否被渲染

greenrange:   一个粒子的 颜 色 green   能改 变 的范 围 ；

greenSpeed:   粒子 green 在生命周期内的改变速度；

lifetime ：生命周期

lifetimeRange ：生命周期范围

magnificationFilter ：不是很清楚好像增加自己的大小

minificatonFilter ：减小自己的大小

minificationFilterBias ：减小大小的因子

name ：粒子的名字

redRange ： 一个粒子的 颜 色 red   能改 变 的范 围 ；

redSpeed;   粒子 red 在生命周期内的改变速度；

scale ：缩放比例：

scaleRange ：缩放比例范围；

scaleSpeed ：缩放比例速度：

spin ：子旋转角度

spinrange ：子旋转角度范围

style ：不是很清楚：

velocity ：速度

velocityRange ：速度范围

xAcceleration: 粒子 x 方向的加速度分量

yAcceleration: 粒子 y 方向的加速度分量

zAcceleration: 粒子 z 方向的加速度分量

Class Methods

defauleValueForKey:   更具健 获 得 值 ；

emitterCell ：初始化方法

shouldArchiveValueForKey: 是否 归 档莫 键值
*/

@end
