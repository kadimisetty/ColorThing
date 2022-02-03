//
//  CTPopoverViewController.h
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/9/21.
//

#import <Cocoa/Cocoa.h>
#import "CTColorLabel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CTPopoverViewControllerDelegate <NSObject>

- (void) askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end


@interface CTPopoverViewController : NSViewController
	<NSTableViewDelegate,
	 NSTableViewDataSource>

@property (nonatomic, weak) id<CTPopoverViewControllerDelegate> delegate;

@property (nonatomic) CTColorLabel* colorLabel;

@end

NS_ASSUME_NONNULL_END
