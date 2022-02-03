//
//  CollectionViewItem.h
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "CTColorLabel.h"
#import "CTCollectionViewItemView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CTCollectionViewItemDelegate <NSObject>

- (void) openEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end


@interface CTCollectionViewItem : NSCollectionViewItem <CTCollectionViewItemViewDelegate>

@property (nonatomic) CTColorLabel* colorLabel;
@property (nonatomic, weak) id<CTCollectionViewItemDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
