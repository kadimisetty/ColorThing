//
//  ColorLabel.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/4/21.
//

#import "ColorLabel.h"

@implementation ColorLabel
// TODO: CONVENIENCE INIT

// MARK: ATTRIOBUTES
@synthesize colorLabelIndexIntegerValue;
@synthesize allGlyphs;
@synthesize activeGlyphIndex;

// MARK: HELPERS

- (NSUInteger)allGlyphsCount {
	return self.allGlyphs.count;
}

- (NSUInteger)glyphsBeforeActiveGlyphCount {
	if (// NO GLYPHS PRESENT
		(!self.allGlyphsCount)
		// AT FIRST INDEX
		|| (self.activeGlyphIndex == 0))
	{
		return 0;
	} else {
		return self.activeGlyphIndex;
	}
}

- (NSUInteger)glyphsAfterActiveGlyphCount {
	if (// NO GLYPHS PRESENT
		(!self.allGlyphsCount)
		// AT LAST INDEX
		|| (self.activeGlyphIndex == (self.allGlyphsCount - 1)))
	{
        return 0;
	} else {
		return (self.activeGlyphIndex + 1);
	}
}

- (NSColor *)nsColorValue {
    switch (self.colorLabelIndexIntegerValue) {
        case -1 :
            // not colored, white (before version 1235, use -1)
            return [NSColor clearColor];
            break;
            
        case 0:
            // red
            return [NSColor redColor];
            break;
        case 1:
            // orange
            return [NSColor orangeColor];
            break;
        case 2:
            // brown
            return [NSColor brownColor];
            break;
        case 3:
            // yellow
            return [NSColor yellowColor];
            break;
        case 4:
            // light green
            return [NSColor greenColor];
            break;
        case 5:
            // dark green
            return [NSColor greenColor];
            break;
        case 6:
            // light blue
            return [NSColor blueColor];
            break;
        case 7:
            // dark blue
            return [NSColor blueColor];
            break;
        case 8:
            // purple
            return [NSColor purpleColor];
            break;
        case 9:
            // magenta
            return [NSColor magentaColor];
            break;
        case 10:
            // light gray
            return [NSColor lightGrayColor];
            break;
        case 11:
            // charcoal
            return [NSColor darkGrayColor];
            break;

    }
}
- (NSString *)colorNameStringValue {
    switch (self.colorLabelIndexIntegerValue) {
        case -1 :
            return @"none";
            break;
            
        case 0:
            return @"red";
            break;
        case 1:
            return @"orange";
            break;
        case 2:
            return @"brown";
            break;
        case 3:
            return @"yellow";
            break;
        case 4:
            return @"light green";
            break;
        case 5:
            return @"dark green";
            break;
        case 6:
            return @"light blue";
            break;
        case 7:
            return @"dark blue";
            break;
        case 8:
            return @"purple";
            break;
        case 9:
            return @"magenta";
            break;
        case 10:
            return @"light gray";
            break;
        case 11:
            return @"charcoal";
            break;

    }
}
@end
