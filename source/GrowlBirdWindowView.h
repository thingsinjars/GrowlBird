//
//  GrowlBirdWindowView.h
//  Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MGTwitterEngine.h"

@interface GrowlBirdWindowView : NSView <MGTwitterEngineDelegate> {
	NSImage				*icon;
	NSString			*title;
	NSString			*text;
	NSDictionary		*textAttributes;
	NSDictionary		*titleAttributes;
	NSColor				*textColor;
	NSColor				*backgroundColor;
	SEL					action;
	id					target;

	NSImage				*cache;
	BOOL				needsDisplay;
	MGTwitterEngine *twitterEngine;

}

- (void) setIcon:(NSImage *)icon;
- (void) setTitle:(NSString *)title;
- (void) setText:(NSString *)text;
- (void) setPriority:(int)priority;

- (id) target;
- (void) setTarget:(id)object;

- (SEL) action;
- (void) setAction:(SEL)selector;

@end
