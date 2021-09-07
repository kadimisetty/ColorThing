//
//  ColorLabel.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//typedef enum : NSInteger {
typedef NS_ENUM(NSInteger, ColorLabelIndex) {
    //NONE: # not colored, white (before version 1235, use -1)
    kColorLabelColorNone = -1,
    
    kColorLabelColorRed = 0,
    kColorLabelColorOrange = 1,
    kColorLabelColorBrown = 2,
    kColorLabelColorYellow = 3,
    kColorLabelColorLightGreen = 4,
    kColorLabelColorDarkGreen = 5,
    kColorLabelColorLightBlue = 6,
    kColorLabelColorDarkBlue = 7,
    kColorLabelColorPurple = 8,
    kColorLabelColorMagenta = 9,
    kColorLabelColorLightGray = 10,
    kColorLabelColorCharcoal = 11,
};


@interface FTColorLabel : NSObject

@property (nonatomic) ColorLabelIndex colorLabelIndexIntegerValue;
@property (nonatomic) NSMutableArray<GSGlyph*>* allGlyphs; // SORTED
@property (nonatomic) NSUInteger activeGlyphIndex;

- (NSUInteger)allGlyphsCount;
- (NSUInteger)glyphsBeforeActiveGlyphCount;
- (NSUInteger)glyphsAfterActiveGlyphCount;

- (NSColor*) nSColorValue;

- (NSString*) colorNameStringValue;

@end

NS_ASSUME_NONNULL_END
