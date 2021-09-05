//
//  FTColors.h
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//
//

#import <Cocoa/Cocoa.h>

@interface FTColors : NSViewController <
GlyphsPalette,
NSCollectionViewDelegate,
NSCollectionViewDataSource,
NSCollectionViewDelegateFlowLayout>


@property (weak) IBOutlet NSCollectionView *collectionView;

@property (weak) IBOutlet NSButton *refreshDataButton;
@property (weak) IBOutlet NSButton *openPreferencesButton;

- (IBAction)refreshData:(id)sender;
- (IBAction)openPreferences:(id)sender;

@end
