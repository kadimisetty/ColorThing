//
//  ColorThing.h
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//
//

#import <Cocoa/Cocoa.h>
#import "CTCollectionViewItem.h"

@interface ColorThing : NSViewController <
		GlyphsPalette,
		NSCollectionViewDelegate,
		NSCollectionViewDataSource,
		NSCollectionViewDelegateFlowLayout,
		CTCollectionViewItemDelegate>


@property (weak) IBOutlet NSCollectionView *collectionView;

@property (weak) IBOutlet NSButton *refreshDataButton;
@property (weak) IBOutlet NSButton *openPreferencesButton;

- (IBAction)refreshData:(id)sender;
- (IBAction)openPreferences:(id)sender;

@end
