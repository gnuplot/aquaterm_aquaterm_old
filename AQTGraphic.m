//
//  AQTGraphic.m
//  AquaTerm
//
//  Created by ppe on Wed May 16 2001.
//  Copyright (c) 2001, 2002 Aquaterm. All rights reserved.
//

#import "AQTGraphic.h"
#import "AQTColorMap.h"

@implementation AQTGraphic
    /**"
    *** An abstract class to derive model objects from
    *** (Overkill at present but could come in handy if the app grows�)
    "**/

-(id)init
{
    if (self = [super init])
    {
      color = [[NSColor clearColor] retain]; // See-through color
    }
    return self; 
}

-(void)dealloc
{
  [color release];
  [super dealloc];
}

-(NSSize)canvasSize
{
  return canvasSize;
}

-(void)setCanvasSize:(NSSize)cs
{
  canvasSize = cs;
}

-(NSColor *)color
{
  return color;
}
//
//	Stubs, needs to be overridden by subclasses
// 
-(NSRect)bounds { return NSMakeRect(0,0,0,0); }
-(void)addObject:(AQTGraphic *)graphic {;}
-(void)removeObject:(AQTGraphic *)graphic {;}
-(void)removeObjectsInRect:(NSRect)targetRect {;}

    /**" 
    *** Needs to be overridden in all subclasses to do actual drawing 
    "**/
-(void)renderInRect:(NSRect)boundsRect
{
    // Not purely abstract, draw a filled box to indicate trouble;-)
    [[NSColor redColor] set];
    [NSBezierPath fillRect:boundsRect];
}

-(void)setColor:(NSColor *)newColor
{
  [newColor retain];
  [color release];
  color = newColor;
}

-(void)updateColors:(AQTColorMap *)colorMap
{
  [self setColor:[colorMap colorForIndex:colorIndex]];
}

@end
