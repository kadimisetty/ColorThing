//
//  CollectionViewItem.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "FTCollectionViewItem.h"
#import "FTCollectionViewItemView.h"
#import "Utils.h"

@implementation FTCollectionViewItem {
	FTCollectionViewItemView* _collectionViewItemView;
}

// MARK: ATTRIBUTES

@synthesize colorLabel;

- (void) setColorLabel:(FTColorLabel *)newValue {
	_collectionViewItemView.colorLabel = newValue;
}

// MARK: LIFECYCLE

- (void)loadView {
	_collectionViewItemView =
		[[FTCollectionViewItemView alloc] initWithFrame:CGRectZero];
	_collectionViewItemView.delegate = self;

	self.view  = _collectionViewItemView;
}

// MARK: CollectionViewItemViewDelegate

- (void)askMainViewControllerToOpenEditViewForGlyphs:(nonnull NSArray<GSGlyph *> *)glyphs {
	[self.delegate openEditViewForGlyphs:glyphs];
}

@end
