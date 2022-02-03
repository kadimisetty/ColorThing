//
//  ColorThing.m
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//
//

#import "ColorThing.h"
#import "CTCollectionViewItem.h"
#import "LeftAlignedCollectionViewFlowLayout.h"
#import "Utils.h"

#import "CTColorLabel.h"

@implementation ColorThing {
	NSMutableDictionary<NSNumber*, CTColorLabel*>* colorLabels;
}

// MARK: ATTRIBUTES

@synthesize windowController;

- (NSUserInterfaceItemIdentifier)collectionViewItemIdentifier {
	return (NSUserInterfaceItemIdentifier) @"collectionViewItemIdentifier";
}

- (NSArray *)sortedColorLabelArray {
	return [[self->colorLabels allValues]
	        sortedArrayUsingComparator: ^NSComparisonResult
	                (CTColorLabel *cl1, CTColorLabel *cl2) {
	                return [[NSNumber numberWithInteger:cl1.colorLabelIndexIntegerValue]
	                        compare:
	                        [NSNumber numberWithInteger:cl2.colorLabelIndexIntegerValue]];
		}];
}

// MARK: GLYPHS
- (NSUInteger)interfaceVersion {
	// Distinguishes the API verison the plugin was built for. Return 1.
	return 1;
}

- (NSString *)title {
	// Return the name of the tool as it will appear in the menu.
	return @"Color Thing";
}

- (NSInteger)maxHeight {
	return 140;
}

- (NSInteger)minHeight {
	return 125;
}

- (NSUInteger)currentHeight {
	return [[NSUserDefaults standardUserDefaults]
	        integerForKey:@"ColorThingCurrentHeight"];
}

- (void)setCurrentHeight:(NSUInteger)newHeight {
	if (newHeight >= [self minHeight] && newHeight <= [self maxHeight]) {
		[[NSUserDefaults standardUserDefaults]
		 setInteger:newHeight
		 forKey:@"ColorThingCurrentHeight"];
	}
}

- (NSView *)theView {
	return [self view];
}

// MARK: LIFECYCLE

- (id) init {
	self = [super initWithNibName:@"ColorThingView"
	        bundle:[NSBundle bundleForClass:[self class]]];
	return self;
}


- (void)viewDidLoad {
	[super viewDidLoad];

	self->colorLabels = [[NSMutableDictionary alloc] init];

	// COLLECTIONVIEW
	self.collectionView.delegate = self;
	self.collectionView.dataSource = self;
	self.collectionView.backgroundColors = @[NSColor.clearColor, NSColor.clearColor];

	// Register collection view items
	[self.collectionView
	 registerClass:[CTCollectionViewItem self]
	 forItemWithIdentifier:[self collectionViewItemIdentifier]];

	// Custom Layout
	LeftAlignedCollectionViewFlowLayout* leftAlignedLayout =
		[[LeftAlignedCollectionViewFlowLayout alloc] init];
	leftAlignedLayout.minimumLineSpacing = 2;
	leftAlignedLayout.minimumInteritemSpacing = 2;
	self.collectionView.collectionViewLayout = leftAlignedLayout;

	// Reload color labels after 2 second delay
	[self performSelector:@selector(refreshColorLabels)
	 withObject:nil
	 afterDelay:2.0f];

	// Reload color lables on interface update
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(interfaceDidUpdate)
	 name: @"GSUpdateInterface"
	 object:nil];

	// Set tooltips on buttons
	self.refreshDataButton.toolTip = @"Refresh Colors Manually";
	self.openPreferencesButton.toolTip = @"Open Preferences";
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter]
	 removeObserver:self
	 name:@"GSUpdateInterface"
	 object:nil];
}

// MARK: CollectionViewDelegate

- (void) interfaceDidUpdate {
	[self refreshColorLabels];
}

- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView
        itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {

	// Create Item
	CTCollectionViewItem* item = [self.collectionView
	                              makeItemWithIdentifier:[self collectionViewItemIdentifier]
	                              forIndexPath:indexPath];

	// Configure Item
	item.colorLabel =
		[[self sortedColorLabelArray] objectAtIndex:indexPath.item];

	// Set CollectionViewItemDelegate
	item.delegate = self;

	// Return Item
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
	CTColorLabel* colorLabel = [[self sortedColorLabelArray] objectAtIndex:indexPath.item];

	// INACTIVE COLORLABEL
	NSString* clAllGlyphsCountString = [NSString stringWithFormat:@"%ld", (long)colorLabel.allGlyphsCount];

	NSTextField* textField = [NSTextField labelWithString:clAllGlyphsCountString];
	textField.font = [Utils colorLabelBodyPreferredFont];
	CGFloat approximateWidth = textField.intrinsicContentSize.width;

	CGFloat kCollectionViewItemViewHeightHeight = 24;
	CGFloat kCollecitonViewItemVerticalPadding = 16;
	return NSMakeSize(approximateWidth + kCollecitonViewItemVerticalPadding,
	                  kCollectionViewItemViewHeightHeight);

	// TODO: INACTIVE COLORLABEL
}

// MARK: Actions

- (IBAction)openPreferences:(id)sender {
}

- (IBAction)refreshData:(id)sender {
	[self refreshColorLabels];
}

// MARK: HELPERS

- (void)refreshColorLabels {
	[self->colorLabels removeAllObjects];
	[self populateColorLabelsFromCurrentDocumentAndReloadCollectionView];
}

- (void)populateColorLabelsFromCurrentDocument {
	for (GSGlyph* glyph in self.windowController.documentFont.allGlyphs) {
		NSInteger colorIndexInteger = glyph.colorIndex;
		NSNumber* colorIndexNumber = [NSNumber numberWithInteger:colorIndexInteger];

		if ([self->colorLabels objectForKey: colorIndexNumber]) {
			// self->colorLabels contains this ColorLabel
			CTColorLabel* colorLabel = [self->colorLabels objectForKey: colorIndexNumber];
			[colorLabel.allGlyphs addObject:glyph];
		} else {
			// self->colorLabels does not contain this ColorLabel. Create one.
			CTColorLabel* colorLabel = [[CTColorLabel alloc] init];
			colorLabel.colorLabelIndexIntegerValue = colorIndexInteger;
			colorLabel.allGlyphs = [[NSMutableArray alloc] initWithArray:@[glyph]];
			colorLabel.activeGlyphIndex = 0;

			// Insert into self->colorLabels
			[self->colorLabels setObject:colorLabel forKey:colorIndexNumber];
		}
	}
}

- (void)populateColorLabelsFromCurrentDocumentAndReloadCollectionView {
	[self populateColorLabelsFromCurrentDocument];
	[self.collectionView reloadData];
}

// MARK: CollectionViewItemDelegate

-(void) openEditViewForGlyphs:(NSArray<GSGlyph *> *)glyphs {
	NSMutableString* glyphsAsString =
		[[NSMutableString alloc] init];
	for (GSGlyph* g in glyphs) {
		[glyphsAsString appendString:
		 [NSString stringWithFormat:@"/%@", g.name]];
	}

	[self.windowController addTabWithString:[glyphsAsString copy]];
}

@end
