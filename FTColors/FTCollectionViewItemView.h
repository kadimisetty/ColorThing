//
//  CollectionViewItemView.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "FTColorLabel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FTCollectionViewItemViewDelegate <NSObject>

- (void) askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end

@interface FTCollectionViewItemView : NSView

@property (nonatomic) FTColorLabel* colorLabel;
@property (nonatomic, weak) id<FTCollectionViewItemViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
