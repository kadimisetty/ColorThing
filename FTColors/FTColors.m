//
//  FTColors.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//  
//

#import "FTColors.h"

@implementation FTColors

@synthesize windowController;

- (id) init {
	self = [super initWithNibName:@"FTColorsView" bundle:[NSBundle bundleForClass:[self class]]];
	return self;
}

- (NSUInteger)interfaceVersion {
	// Distinguishes the API verison the plugin was built for. Return 1.
	return 1;
}

- (NSString *)title {
	// Return the name of the tool as it will appear in the menu.
	return @"FTColors";
}

- (NSInteger)maxHeight {
	return 265;
}

- (NSInteger)minHeight {
	return 125;
}

- (NSUInteger)currentHeight {
	return [[NSUserDefaults standardUserDefaults] integerForKey:@"FTColorsCurrentHeight"];
}

- (void)setCurrentHeight:(NSUInteger)newHeight {
	if (newHeight >= [self minHeight] && newHeight <= [self maxHeight]) {
		[[NSUserDefaults standardUserDefaults] setInteger:newHeight forKey:@"FTColorsCurrentHeight"];
	}
}

- (NSView *)theView {
	return [self view];
}
@end
