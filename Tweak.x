//
//
//
//                  PMP Protect My Photos By ikghd 2020
//                    Hide Your Photos With One Click
//
//
//      didn't used Cephei because i wanted to be a simple as it be
//                  may convert it later if get time
//
//      i know this is not a good way to write a code but i did :D
//
//

static BOOL pmp;

#define PLIST_PATH "/var/mobile/Library/Preferences/pro.ikghd.pmp.plist"
#define boolValueForKey(key) [[[NSDictionary dictionaryWithContentsOfFile:@(PLIST_PATH)] valueForKey:key] boolValue]

static void loadPrefs() {

  pmp  = boolValueForKey(@"pmp");

}



//      Photos

%hook PUAlbumListViewController

- (long long)numberOfVisualSectionsForSectionedGridLayout:(id)arg1 {
  loadPrefs();
    if (pmp ){
    return 1;
  }
    else return %orig;
}
%end


%hook PHFetchOptions
- (unsigned long long)includeAssetSourceTypes {
  loadPrefs();
    if (pmp ){
    return 2;
  }
    else return %orig;
}
%end


%hook PUAlbumListCellContentView
- (void)setSubtitle:(id)arg1 animated:(bool)arg2 {
  loadPrefs();
    if (pmp ){
      arg1 = @"0";
      %orig;
  }
    else return %orig;
}
%end



%hook PUSearchResultsDataSource
- (unsigned long long)numberOfSearchResults {
  loadPrefs();
    if (pmp ){
    return 0;
  }
    else return %orig;
}
%end


%hook PUSuggestedSearchResultsDataSource
- (void)setDelegate:(id)arg1 {
  loadPrefs();
    if (pmp ){
    arg1 = nil;
  }
    else return %orig;
}
%end

//          Photos  End




//        Camera access denied

%hook CAMViewfinderViewController
- (id)_imageWell {
  loadPrefs();
    if (pmp ){
    return nil;
  }
    else return %orig;
}
%end
