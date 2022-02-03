//
//  NSColor+LighterAndDarker.m
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 2/3/22.
//

#import "NSColor+LighterAndDarker.h"

@implementation NSColor (LighterAndDarker)

- (NSColor *)colorWithBrightnessMultiplier: (CGFloat) multiplier {
    
    // IDEA: https://stackoverflow.com/q/11598043/225903
    //
    // KNOWN ISSUES:
    // 1. Cannot run on `NSColor` created using helper names like
    //      `[NSColor whiteColor]` but is fine with something like
    //      `[NSColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0]`

	CGFloat h, s, b, a;
	[(NSColor*)self getHue:&h saturation:&s brightness:&b alpha:&a];
	return [NSColor colorWithHue:h
	        saturation:s
	        brightness:(b * multiplier)
	        alpha:a];
}

- (NSColor *)colorLighterWithDefaultMultiplier {
    return [self colorWithBrightnessMultiplier: 1.3];
}

- (NSColor *)colorDarkerWithDefaultMultiplier {
    return [self colorWithBrightnessMultiplier: 0.75];
}

@end
