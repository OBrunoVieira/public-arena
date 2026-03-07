// This file ensures SPM links the transitive dependencies (Firebase, GoogleSignIn)
// into the final application binary.
import Foundation
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

@objc public class CommentSystemLinker: NSObject {
    @objc public static func link() {
        // Reference symbols to ensure they are not stripped
        print(FIRAuth.self)
        print(FIRApp.self)
        print(GIDSignIn.self)
    }
}
