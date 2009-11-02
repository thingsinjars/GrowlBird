//
//  GrowlBirdPrefs.h
//  Display Plugins
//
//  Copyright 2006-2009 The Growl Project. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>

#define SamplePrefDomain			@"com.Growl.Sample"

#define Bird_SCREEN_PREF			@"Screen"

#define Bird_OPACITY_PREF			@"Opacity"
#define Bird_DEFAULT_OPACITY		60.0f

#define Bird_DURATION_PREF		@"Duration"
#define Bird_DEFAULT_DURATION		4.0f

#define Bird_USERNAME_PREF		@"Username"
#define Bird_DEFAULT_USERNAME		@"growlbirdtest"

#define Bird_PASSWORD_PREF		@"Password"
#define Bird_DEFAULT_PASSWORD		@"testgrowlbird"

#define Bird_PREFIX_PREF		@"Prefix"
#define Bird_DEFAULT_PREFIX		@""

#define Bird_POSTFIX_PREF		@"Postfix"
#define Bird_DEFAULT_POSTFIX		@""

#define Bird_SIZE_PREF			@"Size"
#define Bird_SIZE_NORMAL			0
#define Bird_SIZE_HUGE			1

#define Bird_EFFECT_PREF			@"Transition effect"

typedef enum 
	{
		Bird_EFFECT_SLIDE = 0
	} SampleEffectType;

#define GrowlBirdVeryLowBackgroundColor	@"Sample-Priority-VeryLow-Color"
#define GrowlBirdModerateBackgroundColor	@"Sample-Priority-Moderate-Color"
#define GrowlBirdNormalBackgroundColor	@"Sample-Priority-Normal-Color"
#define GrowlBirdHighBackgroundColor		@"Sample-Priority-High-Color"
#define GrowlBirdEmergencyBackgroundColor	@"Sample-Priority-Emergency-Color"

#define GrowlBirdVeryLowTextColor			@"Sample-Priority-VeryLow-Text-Color"
#define GrowlBirdModerateTextColor		@"Sample-Priority-Moderate-Text-Color"
#define GrowlBirdNormalTextColor			@"Sample-Priority-Normal-Text-Color"
#define GrowlBirdHighTextColor			@"Sample-Priority-High-Text-Color"
#define GrowlBirdEmergencyTextColor		@"Sample-Priority-Emergency-Text-Color"

@interface GrowlBirdPrefs : NSPreferencePane {
	IBOutlet NSSlider *slider_opacity;
	IBOutlet NSString *twitterUsername;
	IBOutlet NSString *twitterPassword;
	IBOutlet NSString *tweetPrefix;
	IBOutlet NSString *tweetPostfix;
}

- (CGFloat) duration;
- (void) setDuration:(CGFloat)value;
- (unsigned) effect;
- (void) setEffect:(unsigned)newEffect;
- (CGFloat) opacity;
- (void) setOpacity:(CGFloat)value;
- (NSInteger) size;
- (void) setSize:(NSInteger)value;
- (NSInteger) screen;
- (void) setScreen:(NSInteger)value;

- (NSColor *) textColorVeryLow;
- (void) setTextColorVeryLow:(NSColor *)value;
- (NSColor *) textColorModerate;
- (void) setTextColorModerate:(NSColor *)value;
- (NSColor *) textColorNormal;
- (void) setTextColorNormal:(NSColor *)value;
- (NSColor *) textColorHigh;
- (void) setTextColorHigh:(NSColor *)value;
- (NSColor *) textColorEmergency;
- (void) setTextColorEmergency:(NSColor *)value;

- (NSColor *) backgroundColorVeryLow;
- (void) setBackgroundColorVeryLow:(NSColor *)value;
- (NSColor *) backgroundColorModerate;
- (void) setBackgroundColorModerate:(NSColor *)value;
- (NSColor *) backgroundColorNormal;
- (void) setBackgroundColorNormal:(NSColor *)value;
- (NSColor *) backgroundColorHigh;
- (void) setBackgroundColorHigh:(NSColor *)value;
- (NSColor *) backgroundColorEmergency;
- (void) setBackgroundColorEmergency:(NSColor *)value;

- (NSString *) twitterUsername;
- (void) setTwitterUsername:(NSString *)value;
- (NSString *) twitterPassword;
- (void) setTwitterPassword:(NSString *)value;

- (NSString *) tweetPrefix;
- (void) setTweetPrefix:(NSString *)value;
- (NSString *) tweetPostfix;
- (void) setTweetPostfix:(NSString *)value;

@end
