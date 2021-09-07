//
//  CollectionViewItemView.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import <Cocoa/Cocoa.h>
#import "ColorLabel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CollectionViewItemViewDelegate <NSObject>

- (void) askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph*>*) glyphs;

@end

@interface CollectionViewItemView : NSView

@property (nonatomic) ColorLabel* colorLabel;
@property (nonatomic, weak) id<CollectionViewItemViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
