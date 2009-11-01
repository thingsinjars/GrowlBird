//
//  GrowlBirdDisplay.h
//  Growl Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <GrowlDisplayPlugin.h>

@class GrowlApplicationNotification;

@interface GrowlBirdDisplay : GrowlDisplayPlugin {
}

- (void) configureBridge:(GrowlNotificationDisplayBridge *)theBridge;

@end
