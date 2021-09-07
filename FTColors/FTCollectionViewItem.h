//
//  CollectionViewItem.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "FTColorLabel.h"
#import "FTCollectionViewItemView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FTCollectionViewItemDelegate <NSObject>

- (void) openEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end


@interface FTCollectionViewItem : NSCollectionViewItem <FTCollectionViewItemViewDelegate>

@property (nonatomic) FTColorLabel* colorLabel;
@property (nonatomic, weak) id<FTCollectionViewItemDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
