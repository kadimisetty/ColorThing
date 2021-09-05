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

- (NSArray *)sortedColorLabelArray {
	return [[self->colorLabels allValues]
	        sortedArrayUsingComparator: ^NSComparisonResult
	                (ColorLabel *cl1, ColorLabel *cl2) {
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


// MARK: LIFECYCLE{
//- (instancetype)initWithNibName:(NSNibName)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//
//
//    return self;
//}

- (id) init {
	self = [super initWithNibName:@"FTColorsView"
	        bundle:[NSBundle bundleForClass:[self class]]];
	return self;
}

//- (void)viewWillAppear {
//    [self.collectionView reloadData];
//}
//
//- (void)viewDidAppear {
//    [self.collectionView reloadData];
//}

- (void)viewDidLoad {
	[super viewDidLoad];
    
    self->colorLabels = [[NSMutableDictionary alloc] init];
//    [self flushColorLabels];
    
	// COLLECTIONVIEW
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColors = @[NSColor.clearColor];
    
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
    
    // Reload color labels after 2 second delay
    [self performSelector:@selector(flushColorLabels)
               withObject:nil
               afterDelay:2.0f];
}

// MARK: CollectionViewDelegate

- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView
        itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {

	// CREATE ITEM
	CollectionViewItem* item = [self.collectionView
	                            makeItemWithIdentifier:[self collectionViewItemIdentifier]
	                            forIndexPath:indexPath];

	// CONFIGURE ITEM
	ColorLabel* cl = [[self sortedColorLabelArray] objectAtIndex:indexPath.item];

	item.name = [NSString stringWithFormat:@"%ld", (long)cl.allGlyphsCount];
	item.nSColorValue = cl.nSColorValue;

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

	CGFloat kCollectionViewItemViewHeightHeight = 18;

	return NSMakeSize(40, kCollectionViewItemViewHeightHeight);

//	// TODO: Use displayed string's attributes
//
//	NSString* string = self->itemNames[indexPath.item];
//
//
//	CGFloat approximateWidth = [NSTextField labelWithString:string].intrinsicContentSize.width;
//
//	CGFloat kCollecitonViewItemVerticalPadding = 20;
//	return NSMakeSize(approximateWidth + kCollecitonViewItemVerticalPadding,
//	                  kCollectionViewItemViewHeightHeight);
}



// MARK: Actions
- (IBAction)openPreferences:(id)sender {

}

- (IBAction)refreshData:(id)sender {
	[self refreshColorLabelsData];
}

// MARK: HELPERS
- (void)refreshColorLabelsData {
    [self flushColorLabels];
}

- (void)flushColorLabels {
	[self->colorLabels removeAllObjects];
    [self populateColorLabelsFromCurrentDocument];
}

- (void)populateColorLabelsFromCurrentDocumentWithoutReloadingCollectionView {
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
}

- (void)populateColorLabelsFromCurrentDocument {
    [self populateColorLabelsFromCurrentDocumentWithoutReloadingCollectionView];
	[self.collectionView reloadData];
}

- (void)showModalAlert:(NSString *)alertInformativeText {
	NSAlert* alert = [[NSAlert alloc] init];
	alert.informativeText = alertInformativeText;
	[alert runModal];
}

@end
