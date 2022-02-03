//
//  ColorLabel.m
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/4/21.
//

#import "CTColorLabel.h"

@implementation CTColorLabel
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

- (NSColor*) textColor {
	switch (self.colorLabelIndexIntegerValue) {
	case kColorLabelColorCharcoal:
	case kColorLabelColorPurple:
	case kColorLabelColorDarkBlue:
		return [NSColor whiteColor];
		break;
	default:
		return [NSColor blackColor];
		break;
	}
}

- (NSColor*) backgroundColor {
	// TODO: Get exact NXColor values using `[GSGlyph color]`
	switch (self.colorLabelIndexIntegerValue)
	{
	case kColorLabelColorRed:
		return [NSColor colorWithRed:0.713 green:0.24 blue:0.099 alpha:1.0];
		break;
	case kColorLabelColorOrange:
		return [NSColor colorWithRed:0.822 green:0.526 blue:0.141 alpha:1.0];
		break;
	case kColorLabelColorBrown:
		return [NSColor colorWithRed:0.552 green:0.414 blue:0.198 alpha:1.0];
		break;
	case kColorLabelColorYellow:
		return [NSColor colorWithRed:0.806 green:0.751 blue:0.098 alpha:1.0];
		break;
	case kColorLabelColorLightGreen:
		return [NSColor colorWithRed:0.567 green:0.79 blue:0.343 alpha:1.0];
		break;
	case kColorLabelColorDarkGreen:
		return [NSColor colorWithRed:0.08 green:0.487 blue:0.088 alpha:1.0];
		break;
	case kColorLabelColorLightBlue:
		return [NSColor colorWithRed:0.094 green:0.511 blue:0.818 alpha:1.0];
		break;
	case kColorLabelColorDarkBlue:
		return [NSColor colorWithRed:0.037 green:0.194 blue:0.742 alpha:1.0];
		break;
	case kColorLabelColorPurple:
		return [NSColor colorWithRed:0.431 green:0.112 blue:0.669 alpha:1.0];
		break;
	case kColorLabelColorMagenta:
		return [NSColor colorWithRed:0.969 green:0.473 blue:0.72 alpha:1.0];
		break;
	case kColorLabelColorLightGray:
		return [NSColor colorWithRed:0.631 green:0.631 blue:0.635 alpha:1.0];
		break;
	case kColorLabelColorCharcoal:
		return [NSColor colorWithRed:0.231 green:0.231 blue:0.235 alpha:1.0];
		break;

	default:
		return [NSColor whiteColor];
		break;
	}
}

@end
