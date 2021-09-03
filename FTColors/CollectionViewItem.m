//
//  CollectionViewItem.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "CollectionViewItem.h"
#import "CollectionViewItemView.h"

@implementation CollectionViewItem {
	CollectionViewItemView* _collectionViewItemView;
}

// MARK: ATTRIBUTES
@synthesize name;

- (void) setName:(NSString *)newValue {
	_collectionViewItemView.name = newValue;
}

// MARK: LIFECYCLE
- (void)loadView {
	_collectionViewItemView =
		[[CollectionViewItemView alloc] initWithFrame:CGRectZero];
	self.view  = _collectionViewItemView;
}


@end
