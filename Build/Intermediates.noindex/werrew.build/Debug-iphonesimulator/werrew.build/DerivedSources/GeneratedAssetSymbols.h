#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The resource bundle ID.
static NSString * const ACBundleID AC_SWIFT_PRIVATE = @"com.wenchangstreet.uikiitapple.werrew";

/// The "Card0" asset catalog color resource.
static NSString * const ACColorNameCard0 AC_SWIFT_PRIVATE = @"Card0";

/// The "Card1" asset catalog color resource.
static NSString * const ACColorNameCard1 AC_SWIFT_PRIVATE = @"Card1";

/// The "Card2" asset catalog color resource.
static NSString * const ACColorNameCard2 AC_SWIFT_PRIVATE = @"Card2";

/// The "Card3" asset catalog color resource.
static NSString * const ACColorNameCard3 AC_SWIFT_PRIVATE = @"Card3";

/// The "Card4" asset catalog color resource.
static NSString * const ACColorNameCard4 AC_SWIFT_PRIVATE = @"Card4";

#undef AC_SWIFT_PRIVATE
