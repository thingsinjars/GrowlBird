//
//  GrowlBirdPrefs.m
//  Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import "GrowlBirdPrefs.h"
#import "GrowlDefinesInternal.h"

@implementation GrowlBirdPrefs

- (NSString *) mainNibName {
	return @"GrowlBirdPrefs";
}

- (void) mainViewDidLoad {
	[slider_opacity setAltIncrementValue:5.0];
}

- (void) didSelect {
	SYNCHRONIZE_GROWL_PREFS();
}

#pragma mark -

+ (NSColor *) loadColor:(NSString *)key defaultColor:(NSColor *)defaultColor {
	NSData *data = nil;
	NSColor *color;
	READ_GROWL_PREF_VALUE(key, SamplePrefDomain, NSData *, &data);
	if (data && [data isKindOfClass:[NSData class]]) {
		color = [NSUnarchiver unarchiveObjectWithData:data];
	} else {
		color = defaultColor;
	}
	[data release];
	
	return color;
}


#pragma mark Accessors

- (CGFloat) duration {
	CGFloat value = Bird_DEFAULT_DURATION;
	READ_GROWL_PREF_FLOAT(Bird_DURATION_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setDuration:(CGFloat)value {
	WRITE_GROWL_PREF_FLOAT(Bird_DURATION_PREF, value, SamplePrefDomain);
	UPDATE_GROWL_PREFS();
}

- (unsigned) effect {
	int effect = 0;
	READ_GROWL_PREF_INT(Bird_EFFECT_PREF, SamplePrefDomain, &effect);
	switch (effect) {
		default:
			effect = Bird_EFFECT_SLIDE;

		case Bird_EFFECT_SLIDE:
			;
	}
	return (unsigned)effect;
}
- (void) setEffect:(unsigned)newEffect {
	switch (newEffect) {
		default:
			break;

		case Bird_EFFECT_SLIDE:
			WRITE_GROWL_PREF_INT(Bird_EFFECT_PREF, newEffect, SamplePrefDomain);
			UPDATE_GROWL_PREFS();
	}
}

- (CGFloat) opacity {
	CGFloat value = Bird_DEFAULT_OPACITY;
	READ_GROWL_PREF_FLOAT(Bird_OPACITY_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setOpacity:(CGFloat)value {
	WRITE_GROWL_PREF_FLOAT(Bird_OPACITY_PREF, value, SamplePrefDomain);
	UPDATE_GROWL_PREFS();
}

- (NSInteger) size {
	NSInteger value = 0;
	READ_GROWL_PREF_INT(Bird_SIZE_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setSize:(NSInteger)value {
	WRITE_GROWL_PREF_INT(Bird_SIZE_PREF, value, SamplePrefDomain);
	UPDATE_GROWL_PREFS();
}

#pragma mark Combo box support

- (NSInteger) numberOfItemsInComboBox:(NSComboBox *)aComboBox {
#pragma unused(aComboBox)
	return [[NSScreen screens] count];
}

- (id) comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)idx {
#pragma unused(aComboBox)
	return [NSNumber numberWithInteger:idx];
}

- (NSInteger) screen {
	NSInteger value = 0;
	READ_GROWL_PREF_INT(Bird_SCREEN_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setScreen:(NSInteger)value {
	WRITE_GROWL_PREF_INT(Bird_SCREEN_PREF, value, SamplePrefDomain);
	UPDATE_GROWL_PREFS();
}

- (NSColor *) textColorVeryLow {
	return [GrowlBirdPrefs loadColor:GrowlBirdVeryLowTextColor
						 defaultColor:[NSColor whiteColor]];
}

- (void) setTextColorVeryLow:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdVeryLowTextColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) textColorModerate {
	return [GrowlBirdPrefs loadColor:GrowlBirdModerateTextColor
						 defaultColor:[NSColor whiteColor]];
}

- (void) setTextColorModerate:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdModerateTextColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) textColorNormal {
	return [GrowlBirdPrefs loadColor:GrowlBirdNormalTextColor
						 defaultColor:[NSColor whiteColor]];
}

- (void) setTextColorNormal:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdNormalTextColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) textColorHigh {
	return [GrowlBirdPrefs loadColor:GrowlBirdHighTextColor
						 defaultColor:[NSColor whiteColor]];
}

- (void) setTextColorHigh:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdHighTextColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) textColorEmergency {
	return [GrowlBirdPrefs loadColor:GrowlBirdEmergencyTextColor
						 defaultColor:[NSColor whiteColor]];
}

- (void) setTextColorEmergency:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdEmergencyTextColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) backgroundColorVeryLow {
	return [GrowlBirdPrefs loadColor:GrowlBirdVeryLowBackgroundColor
						 defaultColor:[NSColor blackColor]];
}

- (void) setBackgroundColorVeryLow:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdVeryLowBackgroundColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) backgroundColorModerate {
	return [GrowlBirdPrefs loadColor:GrowlBirdModerateBackgroundColor
						 defaultColor:[NSColor blackColor]];
}

- (void) setBackgroundColorModerate:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdModerateBackgroundColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) backgroundColorNormal {
	return [GrowlBirdPrefs loadColor:GrowlBirdNormalBackgroundColor
						 defaultColor:[NSColor blackColor]];
}

- (void) setBackgroundColorNormal:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdNormalBackgroundColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) backgroundColorHigh {
	return [GrowlBirdPrefs loadColor:GrowlBirdHighBackgroundColor
						 defaultColor:[NSColor blackColor]];
}

- (void) setBackgroundColorHigh:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdHighBackgroundColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSColor *) backgroundColorEmergency {
	return [GrowlBirdPrefs loadColor:GrowlBirdEmergencyBackgroundColor
						 defaultColor:[NSColor blackColor]];
}

- (void) setBackgroundColorEmergency:(NSColor *)value {
	NSData *theData = [NSArchiver archivedDataWithRootObject:value];
    WRITE_GROWL_PREF_VALUE(GrowlBirdEmergencyBackgroundColor, theData, SamplePrefDomain);
    UPDATE_GROWL_PREFS();
}

- (NSString *) twitterUsername {
	NSString *value = nil;
	READ_GROWL_PREF_VALUE(Bird_USERNAME_PREF, SamplePrefDomain, NSString *, &value);
	return value;
}
- (void) setTwitterUsername:(NSString *)value {
	if (value!=NULL) {
		WRITE_GROWL_PREF_VALUE(Bird_USERNAME_PREF, value, SamplePrefDomain);
	} 
	UPDATE_GROWL_PREFS();
}
- (NSString *) twitterPassword {
	NSString *value = nil;
	READ_GROWL_PREF_VALUE(Bird_PASSWORD_PREF, SamplePrefDomain, NSString *, &value);
	return value;
}
- (void) setTwitterPassword:(NSString *)value {
	if (value!=NULL) {
		WRITE_GROWL_PREF_VALUE(Bird_PASSWORD_PREF, value, SamplePrefDomain);
	} 
	UPDATE_GROWL_PREFS();
}
- (NSString *) tweetPrefix {
	NSString *value = nil;
	READ_GROWL_PREF_VALUE(Bird_PREFIX_PREF, SamplePrefDomain, NSString *, &value);
	return value;
}
- (void) setTweetPrefix:(NSString *)value {
	if (value!=NULL) {
		WRITE_GROWL_PREF_VALUE(Bird_PREFIX_PREF, value, SamplePrefDomain);
	} 
	UPDATE_GROWL_PREFS();
}
- (NSString *) tweetPostfix {
	NSString *value = nil;
	READ_GROWL_PREF_VALUE(Bird_POSTFIX_PREF, SamplePrefDomain, NSString *, &value);
	return value;
}
- (void) setTweetPostfix:(NSString *)value {
	if (value!=NULL) {
		WRITE_GROWL_PREF_VALUE(Bird_POSTFIX_PREF, value, SamplePrefDomain);
	} 
	UPDATE_GROWL_PREFS();
}

- (NSInteger) tweetFormat {
	NSInteger value = 0;
	READ_GROWL_PREF_INT(Bird_FORMAT_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setTweetFormat:(NSInteger)value {
	WRITE_GROWL_PREF_INT(Bird_FORMAT_PREF, value, SamplePrefDomain);
	UPDATE_GROWL_PREFS();
}
- (NSInteger) twitterPincode {
	NSInteger value = 0;
	READ_GROWL_PREF_INT(Bird_PINCODE_PREF, SamplePrefDomain, &value);
	return value;
}
- (void) setTwitterPincode:(NSInteger)value {
	if (value>0) {
		WRITE_GROWL_PREF_INT(Bird_PINCODE_PREF, value, SamplePrefDomain);
	} 
	UPDATE_GROWL_PREFS();
}

//- (IBAction) askForAccess:(id)sender {
//	NSLog(@"Pressed button");
////	openURL:[NSURL URLWithString:@"http://www.apple.com"];
//}

@end
