//
//  CollectionViewItemView.h
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "CTColorLabel.h"
#import "CTPopoverViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CTCollectionViewItemViewDelegate <NSObject>

- (void) askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end

@interface CTCollectionViewItemView : NSView
	<CTPopoverViewControllerDelegate>

@property (nonatomic) CTColorLabel* colorLabel;
@property (nonatomic, weak) id<CTCollectionViewItemViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
