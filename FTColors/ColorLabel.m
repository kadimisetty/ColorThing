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

- (NSColor *)nSColorValue {
	// TODO: get proper nscolor values from `[GSGlyph color]`]
	switch (self.colorLabelIndexIntegerValue)
	{
	case 0:
		// red
		// thunderbird
		return [NSColor colorWithRed:0.713 green:0.24 blue:0.099 alpha:1.0];
		break;
	case 1:
		// orange
		// brandy punch
		return [NSColor colorWithRed:0.822 green:0.526 blue:0.141 alpha:1.0];
		break;
	case 2:
		// brown
		// potters clay
		return [NSColor colorWithRed:0.552 green:0.414 blue:0.198 alpha:1.0];
		break;
	case 3:
		// yellow
		// bird flower
		return [NSColor colorWithRed:0.806 green:0.751 blue:0.098 alpha:1.0];
		break;
	case 4:
		// light green
		// mantis
		return [NSColor colorWithRed:0.567 green:0.79 blue:0.343 alpha:1.0];
		break;
	case 5:
		// dark green
		// bilbao
		return [NSColor colorWithRed:0.08 green:0.487 blue:0.088 alpha:1.0];
		break;
	case 6:
		// light blue
		// denim
		return [NSColor colorWithRed:0.094 green:0.511 blue:0.818 alpha:1.0];
		break;
	case 7:
		// dark blue
		// torea bay
		return [NSColor colorWithRed:0.037 green:0.194 blue:0.742 alpha:1.0];
		break;
	case 8:
		// purple
		// seance
		return [NSColor colorWithRed:0.431 green:0.112 blue:0.669 alpha:1.0];
		break;
	case 9:
		// magenta
		// persian pink
		return [NSColor colorWithRed:0.969 green:0.473 blue:0.72 alpha:1.0];
		break;
	case 10:
		// light gray
		// santas gray
		return [NSColor colorWithRed:0.631 green:0.631 blue:0.635 alpha:1.0];
		break;
	case 11:
		// charcoal
		// ship gray
		return [NSColor colorWithRed:0.231 green:0.231 blue:0.235 alpha:1.0];
		break;

	default:
		// not colored, white (before version 1235, use -1)
		return [NSColor clearColor];
		break;
	}
}
- (NSString *)colorNameStringValue {
	switch (self.colorLabelIndexIntegerValue) {
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

	default:
		// not colored, white (before version 1235, use -1)
		return @"none";
		break;
	}
}
@end
