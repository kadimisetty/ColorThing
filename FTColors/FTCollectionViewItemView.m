//
//  CollectionViewItemView.m
//  FTColors
//
//  Created by Sri Krishna Kadimisetty on 9/3/21.
//

#import "FTCollectionViewItemView.h"
#import "Utils.h"
#import "FTPopoverViewController.h"

@implementation FTCollectionViewItemView {
	NSButton* nameButton;
	NSView* containerView;
	FTColorLabel* _colorLabel;
}

// MARK: ATTRIBUTES

- (FTColorLabel*)getColorLabel {
	return _colorLabel;
}

- (void)setColorLabel:(FTColorLabel *)newValue {
	// Update backed instance property
	_colorLabel = newValue;

	// Configure dependant elements
	NSString* newName =
		[NSString stringWithFormat:@"%lu",(unsigned long)newValue.allGlyphsCount];

	self->nameButton.attributedTitle =
		[[NSAttributedString alloc]
		 initWithString: newName
		 attributes: [self buttonTextStyleAttributesDict]];

	NSColor* newColor = newValue.nSColorValue;
	self->containerView.layer.backgroundColor = newColor.CGColor;
}

- (NSDictionary *)buttonTextStyleAttributesDict {
	return [NSDictionary dictionaryWithObjectsAndKeys:
	        [Utils preferredFont], NSFontAttributeName,
	        [NSColor blackColor], NSForegroundColorAttributeName,
	        nil];
}

// MARK: LAYOUT

- (instancetype)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {

		// INACTIVE COLORLABELVIEW
		self->containerView = [[NSView alloc] initWithFrame:frame];
		self->containerView.translatesAutoresizingMaskIntoConstraints = NO;
		self->containerView.wantsLayer = YES;
		self->containerView.layer.cornerRadius = 4;
		self->containerView.layer.borderWidth = 0.4;
		self->containerView.layer.borderColor =
			[NSColor colorWithWhite:0.4 alpha:1.0].CGColor;

		[self addSubview:self->containerView];
		[Utils constrainEdgesToSuperViewEdgesForView:
		 self->containerView];

		self->nameButton = [[NSButton alloc] initWithFrame:CGRectZero];
		self->nameButton.translatesAutoresizingMaskIntoConstraints = NO;
		[self->nameButton setButtonType:NSButtonTypeMomentaryChange];
		self->nameButton.alignment = NSTextAlignmentCenter;
		self->nameButton.font = [Utils preferredFont];
		self->nameButton.bordered = NO;
		self->nameButton.target = self;
		self->nameButton.action = @selector(didClickNameButton);

		[self->containerView addSubview:self->nameButton];
		[Utils constrainEdgesToSuperViewEdgesForView:self->nameButton];

		// TODO: ACTIVE COLORLABEL
	}

	return self;
}

// MARK: HELPERS

- (void)openColorLabelGlyphsInNewTab {
	[self.delegate
	 askMainViewControllerToOpenEditViewForGlyphs:
	 self.colorLabel.allGlyphs];
}

- (void)didClickNameButton {
	if ([Utils isOptionKeyPressed]) {
		// Option key pressed
		[self openColorLabelGlyphsInNewTab];
	} else {
		// Option Key not pressed
		// TODO: Show popup view
		FTPopoverViewController* somePopoverViewController =
			[[FTPopoverViewController alloc] init];
		somePopoverViewController.delegate = self;

		somePopoverViewController.colorLabel = self.colorLabel;

		NSPopover* somePopover =
			[[NSPopover alloc] init];
		somePopover.contentSize = NSMakeSize(162, 300);
		somePopover.behavior = NSPopoverBehaviorTransient;
		somePopover.contentViewController = somePopoverViewController;

		NSRect rectForSomePopover = [self
		                             convertRect:[self bounds]
		                             toView:[[NSApp mainWindow] contentView]];

		[somePopover showRelativeToRect:rectForSomePopover
		 ofView:[[NSApp mainWindow] contentView]
		 preferredEdge:NSMinYEdge];


	}
}

- (void)askMainViewControllerToOpenEditViewForGlyphs:(NSArray<GSGlyph *> *)glyphs {
	[self.delegate
	 askMainViewControllerToOpenEditViewForGlyphs: glyphs];
}

@end
