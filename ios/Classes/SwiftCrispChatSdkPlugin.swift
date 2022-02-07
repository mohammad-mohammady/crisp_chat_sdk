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
                      self.setSessionBool(call: call, result: result)
                  }
                  else if ("setSessionInt" == call.method) {
                      self.setSessionInt(call: call, result: result)
                  }
                  else if ("setSessionString" == call.method) {
                      self.setSessionString(call: call, result: result)
                  }
                  else if ("setSessionSegment" == call.method) {
                      self.setSessionSegment(call: call, result: result)
                  }
                  else {
                      result(FlutterMethodNotImplemented)
                  }
  }
  
  private func openCrisp(call: FlutterMethodCall, result: FlutterResult) {
          let bottomSheetVC = ChatViewController()
          let viewController = UIApplication.shared.delegate?.window??.rootViewController
          viewController?.present(bottomSheetVC, animated: true, completion: nil)
          result(String("IOS Crisp sdk loaded successful"))
      }
      
      private func configureSdk(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.configure(websiteID: args)
          result(String("IOS Crisp sdk initialized successful"))
      }
      
      private func setTokenID(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.setTokenID(tokenID: args)
          result(String("IOS Crisp sdk setTokenID successful"))
      }
      
      private func resetChatSession(call: FlutterMethodCall, result: FlutterResult) {
          CrispSDK.session.reset()
          result(String("IOS Crisp sdk resetChatSession successful"))
      }
      
      private func setUserAvatar(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.user.avatar = URL(string: args)
          result(String("IOS Crisp sdk setUserAvatar successful"))
      }
      
      private func setUserCompany(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! Dictionary<String, Any>
          let name = args["name"] as? String
          let url = args["url"] as? String
          let companyDescription = args["companyDescription"] as? String
          let employmentJson = args["employment"] as? Dictionary<String, Any>
          let geolocationJson = args["geolocation"] as? Dictionary<String, Any>
          var employment: Employment? = nil
          var geolocation: Geolocation? = nil
          if(employmentJson != nil) {
              let title = employmentJson?["title"] as! String
              let role = employmentJson?["role"] as! String
              employment = Employment(title: title, role: role)
          }
          if(geolocationJson != nil) {
              let city = employmentJson?["city"] as! String
              let country = employmentJson?["country"] as! String
              geolocation = Geolocation(city: city, country: country)
          }
          
            CrispSDK.user.company = Company(name: name,
                                            url: url != nil ? URL(string: url!) : nil,
                                            companyDescription: companyDescription,
                                            employment: employment,
                                            geolocation: geolocation)
          result(String("IOS Crisp sdk setUserCompany successful"))
      }
      
      private func setUserEmail(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.user.email = args
          result(String("IOS Crisp sdk setUserEmail successful"))
      }
      
      private func setUserNickname(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.user.nickname = args
          result(String("IOS Crisp sdk setUserNickname successful"))
      }
      
      private func setUserPhone(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.user.phone = args
          result(String("IOS Crisp sdk setUserPhone successful"))
      }
      
      private func setSessionBool(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! Dictionary<String, Any>
          CrispSDK.session.setBool(args["value"] as! Bool, forKey: args["key"]as! String)
          result(String("IOS Crisp sdk setSessionBool successful"))
      }
    
    private func setSessionInt(call: FlutterMethodCall, result: FlutterResult) {
        let args = call.arguments as! Dictionary<String, Any>
        CrispSDK.session.setInt(args["value"] as! Int, forKey: args["key"]as! String)
        result(String("IOS Crisp sdk setSessionInt successful"))
    }
    
    private func setSessionString(call: FlutterMethodCall, result: FlutterResult) {
        let args = call.arguments as! Dictionary<String, Any>
        CrispSDK.session.setString(args["value"] as! String, forKey: args["key"]as! String)
        result(String("IOS Crisp sdk setSessionString successful"))
    }
    
      private func setSessionSegment(call: FlutterMethodCall, result: FlutterResult) {
          let args = call.arguments as! String
          CrispSDK.session.segment = args
          result(String("IOS Crisp sdk setSessionSegment successful"))
      }
}
