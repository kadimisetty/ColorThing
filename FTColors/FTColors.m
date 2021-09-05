//
//  FTColors.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//
//

#import "FTColors.h"
#import "CollectionViewItem.h"
#import "LeftAlignedCollectionViewFlowLayout.h"
#import "Utils.h"

#import "ColorLabel.h"

// ColorLabel


@implementation FTColors {
	NSMutableDictionary<NSNumber*, ColorLabel*>* colorLabels;
}

// MARK: ATTRIBUTES

@synthesize windowController;

- (NSUserInterfaceItemIdentifier)collectionViewItemIdentifier {
	return (NSUserInterfaceItemIdentifier) @"collectionViewItemIdentifier";
}


// MARK: GLYPHS
- (NSUInteger)interfaceVersion {
	// Distinguishes the API verison the plugin was built for. Return 1.
	return 1;
}

- (NSString *)title {
	// Return the name of the tool as it will appear in the menu.
	return @"FTColors A";
}

- (NSInteger)maxHeight {
	return 265;
}

- (NSInteger)minHeight {
	return 125;
}

- (NSUInteger)currentHeight {
	return [[NSUserDefaults standardUserDefaults]
	        integerForKey:@"FTColorsCurrentHeight"];
}

- (void)setCurrentHeight:(NSUInteger)newHeight {
	if (newHeight >= [self minHeight] && newHeight <= [self maxHeight]) {
		[[NSUserDefaults standardUserDefaults]
		 setInteger:newHeight
		 forKey:@"FTColorsCurrentHeight"];
	}
}

- (NSView *)theView {
	return [self view];
}


// MARK: LIFECYCLE
- (id) init {
	self = [super initWithNibName:@"FTColorsView"
	        bundle:[NSBundle bundleForClass:[self class]]];

	self->colorLabels = [[NSMutableDictionary alloc] init];

	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	// COLLECTIONVIEW
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.collectionView.backgroundColors = @[
		[NSColor yellowColor],
		[NSColor greenColor]];

	// Register collection view items
	[self.collectionView
	 registerClass:[CollectionViewItem self]
	 forItemWithIdentifier:[self collectionViewItemIdentifier]];

	// Custom Layout
	LeftAlignedCollectionViewFlowLayout* leftAlignedLayout =
		[[LeftAlignedCollectionViewFlowLayout alloc] init];
	leftAlignedLayout.minimumLineSpacing = 2;
	leftAlignedLayout.minimumInteritemSpacing = 2;
	self.collectionView.collectionViewLayout = leftAlignedLayout;

//    [self->colorLabels remove
	[self populateColorLabelsFromCurrentDocument];
}

// MARK: CollectionViewDelegate
- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView
        itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {

	// CREATE ITEM
	CollectionViewItem* item = [self.collectionView
	                            makeItemWithIdentifier:[self collectionViewItemIdentifier]
	                            forIndexPath:indexPath];

	// CONFIGURE ITEM
	// TODO: Make sorted
	NSInteger count =
		[[self->colorLabels allValues] objectAtIndex:indexPath.item].allGlyphsCount;

	item.name = [NSString stringWithFormat:@"%ld", (long)count];

	// RETURN ITEM
	return item;
}

- (NSInteger)collectionView:(nonnull NSCollectionView *)collectionView
        numberOfItemsInSection:(NSInteger)section {
	return self->colorLabels.count;
}

// MARK: NSCollectionViewDelegateFlowLayout

- (NSSize)collectionView:(NSCollectionView *)collectionView
        layout:(NSCollectionViewLayout *)collectionViewLayout
        sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

	return NSMakeSize(40, 20);

//	// TODO: Use displayed string's attributes
//
//	NSString* string = self->itemNames[indexPath.item];
//
//
//	CGFloat approximateWidth = [NSTextField labelWithString:string].intrinsicContentSize.width;
//
//	CGFloat kCollectionViewItemViewHeightHeight = 20;
//	CGFloat kCollecitonViewItemVerticalPadding = 20;
//	return NSMakeSize(approximateWidth + kCollecitonViewItemVerticalPadding,
//	                  kCollectionViewItemViewHeightHeight);
}



// MARK: Actions
- (IBAction)openPreferences:(id)sender {

}

- (IBAction)refreshData:(id)sender {
	[self showModalAlert: [NSString stringWithFormat:
	                       @"number of red glyphs:%ld",
	                       (long)[self numberOfglyphsInRedColor]]];
}

// MARK: HELPERS

- (void)flushColorLabels {
	[self->colorLabels removeAllObjects];
	[self.collectionView reloadData];
}

- (void)populateColorLabelsFromCurrentDocument {
	for (GSGlyph* glyph in self.windowController.documentFont.allGlyphs) {
		NSInteger colorIndexInteger = glyph.colorIndex;
		NSNumber* colorIndexNumber = [NSNumber numberWithInteger:colorIndexInteger];

		if ([self->colorLabels objectForKey: colorIndexNumber]) {
			// self->colorLabels contains this ColorLabel
			ColorLabel* colorLabel = [self->colorLabels objectForKey: colorIndexNumber];
			[colorLabel.allGlyphs addObject:glyph];
		} else {
			// self->colorLabels does not contain this ColorLabel. Create one.
			ColorLabel* colorLabel = [[ColorLabel alloc] init];
			colorLabel.colorLabelIndexIntegerValue = colorIndexInteger;
			colorLabel.allGlyphs = [[NSMutableArray alloc] initWithArray:@[glyph]];
			colorLabel.activeGlyphIndex = 0;

			// Insert into self->colorLabels
			[self->colorLabels setObject:colorLabel forKey:colorIndexNumber];
		}
	}

	[self.collectionView reloadData];
}

- (NSUInteger)numberOfglyphsInRedColor {
	[self flushColorLabels];
	[self populateColorLabelsFromCurrentDocument];

	ColorLabel* redColorLabel =
		[self->colorLabels objectForKey:[NSNumber numberWithInteger:kColorLabelColorRed]];
	if (redColorLabel) {
		// not nil
		return redColorLabel.allGlyphsCount;
	} else {
		// nil
		return 0;
	}
}

- (void)showModalAlert:(NSString *)alertInformativeText {
	NSAlert* alert = [[NSAlert alloc] init];
	alert.informativeText = alertInformativeText;
	[alert runModal];
}

@end
