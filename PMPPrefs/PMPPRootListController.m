#include "PMPPRootListController.h"
#import "NSTask.h"


@implementation PMPPRootListController


- (id)init {
  self = [super init];

  if (self) {
    UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(apply)];
    self.navigationItem.rightBarButtonItem = applyButton;

    // Ha! Who needs libcephei? Not me.
    // BUG: changes the whole settings tint color
  }

  return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}


- (void)twitter {
  NSURL *url;

	// check which of these apps are installed
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetbot:"]]) {
		url = [NSURL URLWithString:@"tweetbot:///user_profile/ikg_hd"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitterrific:"]]) {
		url = [NSURL URLWithString:@"twitterrific:///profile?screen_name=ikg_hd"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tweetings:"]]) {
		url = [NSURL URLWithString:@"tweetings:///user?screen_name=ikg_hd"];
	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter:"]]) {
		url = [NSURL URLWithString:@"twitter://user?screen_name=ikg_hd"];
	}
	else {
		url = [NSURL URLWithString:@"https://mobile.twitter.com/ikg_hd"];
	}

	// open my profile in the app chosen above
	// if you're compiling with an iOS 10 or lower sdk you can leave out options:@{} and completionHandler:nil
	[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}




- (void)ytkiller {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://repo.ikghd.me/depictions/?p=pro.ikghd.youtubekiller"]];
}

- (void)ictmiz1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://repo.ikghd.me/depictions/?p=pro.ikghd.ictmiz"]];
}




-(void)apply {
	NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"MobileSlideShow", nil]];
    [t launch];

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"PMP" message:@"Changes Has Been applied Successfully👌." preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
    NSLog(@"OK");
  }];

  [alertController addAction:cancel];

  [self presentViewController:alertController animated: YES completion: nil];


}

@end
