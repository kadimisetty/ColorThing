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

@implementation FTColors {
    NSArray<NSString *>* _itemNames;
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
    self =[super initWithNibName:@"FTColorsView"
           bundle:[NSBundle bundleForClass:[self class]]];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _itemNames = @[@"one", @"two", @"three"];

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
    
    // Custom layout
    LeftAlignedCollectionViewFlowLayout* leftAlignedLayout =
        [[LeftAlignedCollectionViewFlowLayout alloc] init];
    leftAlignedLayout.minimumLineSpacing = 2;
    leftAlignedLayout.minimumInteritemSpacing = 2;
    _collectionView.collectionViewLayout = leftAlignedLayout;
}

// MARK: CollectionViewDelegate
- (nonnull NSCollectionViewItem *)collectionView:(nonnull NSCollectionView *)collectionView
        itemForRepresentedObjectAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CollectionViewItem* item =
        [collectionView
         makeItemWithIdentifier:[self collectionViewItemIdentifier]
         forIndexPath:indexPath];

    // Configure Item
    item.name = [_itemNames
                 objectAtIndex:indexPath.item];

    return item;
}

- (NSInteger)collectionView:(nonnull NSCollectionView *)collectionView
        numberOfItemsInSection:(NSInteger)section {
    return _itemNames.count;
}


// MARK: NSCollectionViewDelegateFlowLayout

- (NSSize)collectionView:(NSCollectionView *)collectionView
        layout:(NSCollectionViewLayout *)collectionViewLayout
        sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Use displayed string's attriutes
    NSString* string = _itemNames[indexPath.item];
    CGFloat approximateWidth = [NSTextField labelWithString:string].intrinsicContentSize.width;

    CGFloat kCollectionViewItemViewHeightHeight = 20;
    CGFloat kCollecitonViewItemVerticalPadding = 20;
    return NSMakeSize(approximateWidth + kCollecitonViewItemVerticalPadding,
                      kCollectionViewItemViewHeightHeight);
}


@end
