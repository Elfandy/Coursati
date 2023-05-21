import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    //**** Google Maps API Key
    GMSServices.provideAPIKey("AIzaSyBbg24GYIH8LvMFHWMkK7QGqLcsMMk0n3w")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
