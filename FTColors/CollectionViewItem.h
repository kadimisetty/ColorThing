//
//  CollectionViewItem.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "ColorLabel.h"
#import "CollectionViewItemView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CollectionViewItemDelegate <NSObject>

- (void) openEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end


@interface CollectionViewItem : NSCollectionViewItem <CollectionViewItemViewDelegate>

@property (nonatomic) ColorLabel* colorLabel;
@property (nonatomic) id<CollectionViewItemDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
