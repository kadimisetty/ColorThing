//
//  FTPopoverViewController.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/9/21.
//

#import <Cocoa/Cocoa.h>
#import "FTColorLabel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FTPopoverViewControllerDelegate <NSObject>

- (void) askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end


@interface FTPopoverViewController : NSViewController
	<NSTableViewDelegate,
	 NSTableViewDataSource>

@property (nonatomic, weak) id<FTPopoverViewControllerDelegate> delegate;

@property (nonatomic) FTColorLabel* colorLabel;

@end

NS_ASSUME_NONNULL_END
