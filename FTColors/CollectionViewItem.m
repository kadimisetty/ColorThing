//
//  CollectionViewItem.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "CollectionViewItem.h"
#import "CollectionViewItemView.h"
#import "Utils.h"

@implementation CollectionViewItem {
	CollectionViewItemView* _collectionViewItemView;
}

// MARK: ATTRIBUTES

@synthesize colorLabel;

- (void) setColorLabel:(ColorLabel *)newValue {
    _collectionViewItemView.colorLabel = newValue;
}

// MARK: LIFECYCLE

- (void)loadView {
	_collectionViewItemView =
		[[CollectionViewItemView alloc] initWithFrame:CGRectZero];
    _collectionViewItemView.delegate = self;
    
	self.view  = _collectionViewItemView;
}

// MARK: CollectionViewItemViewDelegate

- (void)askMainViewControllerToOpenEditViewForGlyphs:(nonnull NSArray<GSGlyph *> *)glyphs {
    [self.delegate openEditViewForGlyphs:glyphs];
}

@end
