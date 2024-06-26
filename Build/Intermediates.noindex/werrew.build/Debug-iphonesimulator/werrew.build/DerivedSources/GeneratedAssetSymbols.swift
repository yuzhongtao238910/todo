import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "Card0" asset catalog color resource.
    static let card0 = DeveloperToolsSupport.ColorResource(name: "Card0", bundle: resourceBundle)

    /// The "Card1" asset catalog color resource.
    static let card1 = DeveloperToolsSupport.ColorResource(name: "Card1", bundle: resourceBundle)

    /// The "Card2" asset catalog color resource.
    static let card2 = DeveloperToolsSupport.ColorResource(name: "Card2", bundle: resourceBundle)

    /// The "Card3" asset catalog color resource.
    static let card3 = DeveloperToolsSupport.ColorResource(name: "Card3", bundle: resourceBundle)

    /// The "Card4" asset catalog color resource.
    static let card4 = DeveloperToolsSupport.ColorResource(name: "Card4", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "Card0" asset catalog color.
    static var card0: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .card0)
#else
        .init()
#endif
    }

    /// The "Card1" asset catalog color.
    static var card1: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .card1)
#else
        .init()
#endif
    }

    /// The "Card2" asset catalog color.
    static var card2: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .card2)
#else
        .init()
#endif
    }

    /// The "Card3" asset catalog color.
    static var card3: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .card3)
#else
        .init()
#endif
    }

    /// The "Card4" asset catalog color.
    static var card4: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .card4)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "Card0" asset catalog color.
    static var card0: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .card0)
#else
        .init()
#endif
    }

    /// The "Card1" asset catalog color.
    static var card1: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .card1)
#else
        .init()
#endif
    }

    /// The "Card2" asset catalog color.
    static var card2: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .card2)
#else
        .init()
#endif
    }

    /// The "Card3" asset catalog color.
    static var card3: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .card3)
#else
        .init()
#endif
    }

    /// The "Card4" asset catalog color.
    static var card4: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .card4)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "Card0" asset catalog color.
    static var card0: SwiftUI.Color { .init(.card0) }

    /// The "Card1" asset catalog color.
    static var card1: SwiftUI.Color { .init(.card1) }

    /// The "Card2" asset catalog color.
    static var card2: SwiftUI.Color { .init(.card2) }

    /// The "Card3" asset catalog color.
    static var card3: SwiftUI.Color { .init(.card3) }

    /// The "Card4" asset catalog color.
    static var card4: SwiftUI.Color { .init(.card4) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "Card0" asset catalog color.
    static var card0: SwiftUI.Color { .init(.card0) }

    /// The "Card1" asset catalog color.
    static var card1: SwiftUI.Color { .init(.card1) }

    /// The "Card2" asset catalog color.
    static var card2: SwiftUI.Color { .init(.card2) }

    /// The "Card3" asset catalog color.
    static var card3: SwiftUI.Color { .init(.card3) }

    /// The "Card4" asset catalog color.
    static var card4: SwiftUI.Color { .init(.card4) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

