//
//  CollectionViewItem.m
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "CTCollectionViewItem.h"
#import "CTCollectionViewItemView.h"
#import "Utils.h"

@implementation CTCollectionViewItem {
	CTCollectionViewItemView* _collectionViewItemView;
}

// MARK: ATTRIBUTES

@synthesize colorLabel;

- (void) setColorLabel:(CTColorLabel *)newValue {
	_collectionViewItemView.colorLabel = newValue;
}

// MARK: LIFECYCLE

- (void)loadView {
	_collectionViewItemView =
		[[CTCollectionViewItemView alloc] initWithFrame:CGRectZero];
	_collectionViewItemView.delegate = self;

	self.view  = _collectionViewItemView;
}

// MARK: CollectionViewItemViewDelegate

- (void)askMainViewControllerToOpenEditViewForGlyphs:(nonnull NSArray<GSGlyph *> *)glyphs {
	[self.delegate openEditViewForGlyphs:glyphs];
}

@end
