//
//  NSColor+LighterAndDarker.h
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 2/3/22.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSColor (LighterAndDarker)

- (NSColor *)colorWithBrightnessMultiplier:(CGFloat) multiplier;
- (NSColor *)colorLighterWithDefaultMultiplier;
- (NSColor *)colorDarkerWithDefaultMultiplier;
@end

NS_ASSUME_NONNULL_END
