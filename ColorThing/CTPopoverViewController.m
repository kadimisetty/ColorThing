//
//  CTPopoverViewController.m
//  ColorThing
//
//  Created by Sri Krishna Kadimisetty on 9/9/21.
//

#import "CTPopoverViewController.h"
#import "Utils.h"

@interface CTPopoverViewController ()

@end

@implementation CTPopoverViewController {
	NSScrollView* containerScrollView;
	NSTableView* tableView;
	NSArray<NSString*>* names;
	CTColorLabel* _colorLabel;
}

// MARK: ATTRIBUTES

- (CTColorLabel*)getColorLabel {
	return _colorLabel;
}

- (void)setColorLabel:(CTColorLabel *)newValue {
	// Update backed instance property
	_colorLabel = newValue;
//    [self->tableView reloadData];
}

// MARK: LIFECYCLE

- (void)viewDidLoad {
	[super viewDidLoad];

	[self->tableView reloadData];
}

- (void)loadView {
	self.view = [[NSView alloc] initWithFrame:CGRectZero];
	self.view.wantsLayer = YES;
	self.view.layer.backgroundColor = NSColor.yellowColor.CGColor;

	self->containerScrollView =
		[[NSScrollView alloc] initWithFrame:CGRectZero];

	self->tableView = [[NSTableView alloc] initWithFrame:CGRectZero];
	self->tableView.delegate = self;
	self->tableView.dataSource = self;
	self->tableView.target = self;
	self->tableView.action = @selector(didClickRowAndColumnInsideTableView);

	NSUserInterfaceItemIdentifier column1Identifier = (NSUserInterfaceItemIdentifier)@"column1Identifier";

	NSTableColumn* column1 =
		[[NSTableColumn alloc] initWithIdentifier:column1Identifier];

	column1.width = 1;
	[self->tableView addTableColumn:column1];
	[self->tableView setHeaderView:nil];

	self->containerScrollView.documentView = self->tableView;
	self->containerScrollView.hasVerticalScroller = YES;
	self.view = self->containerScrollView;
}

// MARK: Delegates

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	return self.colorLabel.allGlyphsCount;
}

- (NSView *)tableView:(NSTableView *)tableView
        viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	NSTextField* labelView = [[NSTextField alloc] init];

	labelView.stringValue = self.colorLabel.allGlyphs[row].name;
	labelView.editable = NO;
	labelView.bordered = NO;
	labelView.backgroundColor = NSColor.clearColor;

	return labelView;
}

- (CGFloat)tableView:(NSTableView *)tableView
        heightOfRow:(NSInteger)row {
	return 20;
}

-(void)didClickRowAndColumnInsideTableView {
	[self.delegate
	 askMainViewControllerToOpenEditViewForGlyphs:
	 @[self.colorLabel.allGlyphs[self->tableView.clickedRow]]];
}

@end
