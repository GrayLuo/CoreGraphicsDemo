//
//  CGView.m
//  CoreGraphicsDemo
//
//  Created by hyq on 15/11/30.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "CGView.h"

@implementation CGView

- (void)drawRect:(CGRect)rect {
//    [self basicDrawRect];

//    [self basicDrawRect2];
    
//    [self linesDraw];
    
//    [self curveDraw];
    
//    [self threeHairDraw];
    
    [self bezierDraw];
}

- (void)basicDrawRect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //红色矩形
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    CGContextFillRect(ctx, CGRectMake(0, 0, 200, 100));
    //蓝色矩形
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 0.5);//半透明
    CGContextFillRect(ctx, CGRectMake(0, 0, 100, 200));
}

- (void)basicDrawRect2{
#define COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddRect(ctx, CGRectMake(0, 0, 200, 100));
    CGContextSetFillColorWithColor(ctx, COLOR(255, 0, 0, 1).CGColor);
    CGContextFillPath(ctx);

    CGContextAddRect(ctx, CGRectMake(0, 0, 100, 200));
    CGContextSetFillColorWithColor(ctx, COLOR(0, 0, 255, 0.5).CGColor);
    CGContextFillPath(ctx);
}



- (void)linesDraw{
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 220,220);
    CGPathAddLineToPoint(path, nil, 300,300);
    CGPathAddLineToPoint(path, nil, 200, 400);
    CGContextAddPath(ctx, path);
    
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);//笔触色:红色
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);//填充色:蓝色
    CGContextSetLineWidth(ctx, 2);//线条宽度
    CGContextSetLineCap(ctx, kCGLineCapRound);//线条头样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);//线条连接点样式
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
    
    CGPathRelease(path);
    
}

- (void)curveDraw{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 10, 10);
    CGContextAddCurveToPoint(ctx, 300, 300, 150, 150, 20, 400);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    CGContextStrokePath(ctx);
}
- (void)threeHairDraw{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //step 1:绘制圆形脸蛋
    //绘制椭圆前，先要指定其所在矩形区域
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 200, 200));
    //填充色
    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
    CGContextFillPath(ctx);
    
    
    //step2:画眼睛
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    //左眼
    //画圆有多种方法，这是用画一条曲线的方式，可以使用上面的矩形方式
    CGContextAddArc(ctx, 150, 150, 10, 0, 2*M_PI, 1);
    CGContextFillPath(ctx);
    //右眼
    CGContextAddArc(ctx, 300-50, 150, 10, 0, 2*M_PI, 1);
    CGContextFillPath(ctx);
    
    //step3:画鼻子
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGContextMoveToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 220,220);
    CGContextAddLineToPoint(ctx, 180, 220);
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextFillPath(ctx);
    
     //step 4:画嘴巴
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextAddRect(ctx, CGRectMake(170, 260, 60, 10));
    CGContextFillPath(ctx);
 
    //step 5:画三毛
    CGContextSetStrokeColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    
    CGContextMoveToPoint(ctx, 200, 100);
    CGContextAddCurveToPoint(ctx, 180, 80, 220, 60, 180, 30);

    CGContextMoveToPoint(ctx, 200, 100);
    CGContextAddCurveToPoint(ctx, 220, 80, 180, 60, 200, 30);

    CGContextMoveToPoint(ctx, 200, 100);
    CGContextAddCurveToPoint(ctx, 240, 80, 160, 60, 200, 30);

    CGContextStrokePath(ctx);
}

- (void)bezierDraw{   
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    // Set the starting point of the shape.
    [aPath moveToPoint:CGPointMake(100.0, 0.0)];
    
    // Draw the lines.
    [aPath addLineToPoint:CGPointMake(200.0, 40.0)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath addLineToPoint:CGPointMake(40.0, 140)];
    [aPath addLineToPoint:CGPointMake(0.0, 40.0)];
    //勾勒还是填充stroke or fill
    [aPath stroke];
    [aPath closePath];
    
    UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(300, 300) radius:30 startAngle:0 endAngle:2*M_PI clockwise:YES];
    [[UIColor redColor] setFill];
    [arcPath fill];
    [arcPath closePath];
    
}
@end
