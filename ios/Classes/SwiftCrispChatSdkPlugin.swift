import Flutter
import UIKit
import Crisp


public class SwiftCrispChatSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "crisp_chat_sdk", binaryMessenger: registrar.messenger())
    let instance = SwiftCrispChatSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if ("configure" == call.method) {
                      self.configureSdk(call: call, result: result)
                  }
                  else if ("setTokenID" == call.method) {
                      self.setTokenID(call: call, result: result)
                  }
                  else if ("openCrisp" == call.method) {
                      self.openCrisp(call: call, result: result)
                  }
                  else if ("resetChatSession" == call.method) {
                      self.resetChatSession(call: call, result: result)
                  }
                  else if ("setUserAvatar" == call.method) {
                      self.setUserAvatar(call: call, result: result)
                  }
                  else if ("setUserCompany" == call.method) {
                      self.setUserCompany(call: call, result: result)
                  }
                  else if ("setUserEmail" == call.method) {
                      self.setUserEmail(call: call, result: result)
                  }
                  else if ("setUserNickname" == call.method) {
                      self.setUserNickname(call: call, result: result)
                  }
                  else if ("setUserPhone" == call.method) {
                      self.setUserPhone(call: call, result: result)
                  }
                  else if ("setSessionBool" == call.method) {
                      self.setSessionData(call: call, result: result)
                  }
                  else if ("setSessionInt" == call.method) {
                      self.setSessionData(call: call, result: result)
                  }
                  else if ("setSessionString" == call.method) {
                      self.setSessionData(call: call, result: result)
                  }
                  else if ("setSessionSegment" == call.method) {
                      self.setSessionSegment(call: call, result: result)
                  }
                  else {
                      result(FlutterMethodNotImplemented)
                  }
  }
  
  private func openCrisp(call: FlutterMethodCall, result: FlutterResult) {
          let bottomSheetVC = ViewController()
          let viewController = UIApplication.shared.delegate?.window??.rootViewController
          viewController?.present(bottomSheetVC, animated: true, completion: nil)
          result(String("IOS Crisp sdk loaded successful"))
      }
      
      private func configureSdk(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.initialize(websiteId: args)
          result(String("IOS Crisp sdk initialized successful"))
      }
      
      private func setTokenID(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.tokenId = args
          result(String("IOS Crisp sdk setTokenID successful"))
      }
      
      private func resetChatSession(call: FlutterMethodCall, result: FlutterResult) {
          Crisp.session.reset()
          result(String("IOS Crisp sdk resetChatSession successful"))
      }
      
      private func setUserAvatar(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.user.set(avatar: args)
          result(String("IOS Crisp sdk setUserAvatar successful"))
      }
      
      private func setUserCompany(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! Dictionary<String, Any>
          Crisp.session.set(data: args)
          result(String("IOS Crisp sdk setUserCompany successful"))
      }
      
      private func setUserEmail(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.user.set(email: args)
          result(String("IOS Crisp sdk setUserEmail successful"))
      }
      
      private func setUserNickname(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.user.set(nickname: args)
          result(String("IOS Crisp sdk setUserNickname successful"))
      }
      
      private func setUserPhone(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.user.set(phone: args)
          result(String("IOS Crisp sdk setUserPhone successful"))
      }
      
      private func setSessionData(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! Dictionary<String, Any>
          Crisp.session.set(data: args)
          result(String("IOS Crisp sdk setSessionData successful"))
      }
      
      private func setSessionSegment(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          Crisp.session.set(segment: args)
          result(String("IOS Crisp sdk setSessionSegment successful"))
      }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let crispView = CrispView()
        crispView.bounds = view.bounds
        crispView.center = view.center

        view.addSubview(crispView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
