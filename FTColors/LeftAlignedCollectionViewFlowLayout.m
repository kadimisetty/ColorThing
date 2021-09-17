//
//  LeftAlignedCollectionViewFlowLayout.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "LeftAlignedCollectionViewFlowLayout.h"

@implementation LeftAlignedCollectionViewFlowLayout

- (NSArray<__kindof NSCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(NSRect)rect {

	// READ: https://stackoverflow.com/a/36285721/225903
	// WARNING: Doesn't account for items of varying heights.

	NSArray<__kindof NSCollectionViewLayoutAttributes *>
	*defaultAttributes =
		[super layoutAttributesForElementsInRect:rect];

	if (![defaultAttributes count]) {
		return defaultAttributes;
	} else {
		NSMutableArray<__kindof NSCollectionViewLayoutAttributes *>
		*leftAlignedAttributes = [[NSMutableArray alloc] init];

		CGFloat xCursor = self.sectionInset.left;
		CGFloat lastYPosition = defaultAttributes[0].frame.origin.y;

		for (NSCollectionViewLayoutAttributes *attributes in defaultAttributes) {
			if (attributes.frame.origin.y > lastYPosition) {
				xCursor = self.sectionInset.left;
				lastYPosition = attributes.frame.origin.y;
			}

			NSRect asFrame = attributes.frame;
			asFrame.origin.x = xCursor;
			[attributes setFrame:asFrame];

			xCursor += attributes.frame.size.width + self.minimumInteritemSpacing;
			[leftAlignedAttributes addObject:attributes];
		}

		return leftAlignedAttributes;
	}
}

@end
