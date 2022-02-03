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
	switch (self.colorLabelIndexIntegerValue)
	{
        case kColorLabelColorRed:
            return [NSColor colorWithRed:0.85 green:0.26 blue:0.06 alpha:1.0];
            break;

        case kColorLabelColorOrange:
            return [NSColor colorWithRed:0.99 green:0.62 blue:0.11 alpha:1.0];
            break;

        case kColorLabelColorBrown:
            return [NSColor colorWithRed:0.65 green:0.48 blue:0.2 alpha:1.0];
            break;

        case kColorLabelColorYellow:
            return [NSColor colorWithRed:0.97 green:0.9 blue:0 alpha:1.0];
            break;

        case kColorLabelColorLightGreen:
            return [NSColor colorWithRed:0.67 green:0.95 blue:0.38 alpha:1.0];
            break;

        case kColorLabelColorDarkGreen:
            return [NSColor colorWithRed:0.04 green:0.57 blue:0.04 alpha:1.0];
            break;

        case kColorLabelColorLightBlue:
            return [NSColor colorWithRed:0.06 green:0.6 blue:0.98 alpha:1.0];
            break;

        case kColorLabelColorDarkBlue:
            return [NSColor colorWithRed:0 green:0.2 blue:0.88 alpha:1.0];
            break;

        case kColorLabelColorPurple:
            return [NSColor colorWithRed:0.5 green:0.09 blue:0.79 alpha:1.0];
            break;

        case kColorLabelColorMagenta:
            return [NSColor colorWithRed:0.98 green:0.36 blue:0.67 alpha:1.0];
            break;

        case kColorLabelColorLightGray:
            return [NSColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0];
            break;

        case kColorLabelColorCharcoal:
            return [NSColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.0];
            break;
            
        default:
            // WHITE
            return [NSColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
            break;
	}
}

@end
