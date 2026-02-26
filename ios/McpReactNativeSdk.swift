import Evergage
import Foundation

@objcMembers
class f442: NSObject {

  static func toItem(json: [String: Any]) -> EVGProduct {
    let item = EVGProduct(id: json[SwiftObfuscator.decode("ZXZnSWQ=")] as! String)
    item.name = json[SwiftObfuscator.decode("bmFtZQ==")] as? String
    item.priceDescription = json[SwiftObfuscator.decode("cHJpY2VEZXNjcmlwdGlvbg==")] as? String
    item.url = json[SwiftObfuscator.decode("dXJs")] as? String
    item.imageUrl = json[SwiftObfuscator.decode("aW1hZ2VVcmw=")] as? String
    item.price = json[SwiftObfuscator.decode("cHJpY2U=")] as? NSNumber ?? 1.0
    return item
  }

  static func toReview(json: [String: Any]) -> EVGReview {
    let id = json[SwiftObfuscator.decode("aWQ=")] as? String ?? ""
    let title = json[SwiftObfuscator.decode("dGl0bGU=")] as? String
    let date: Date? = (json[SwiftObfuscator.decode("ZGF0ZQ==")] as? String).flatMap { ISO8601DateFormatter().date(from: $0) }
    let rating = json[SwiftObfuscator.decode("cmF0aW5n")] as? NSNumber
    let purchased = json[SwiftObfuscator.decode("cHVyY2hhc2Vk")] as? Bool ?? false

    return EVGReview(itemId: id, date: date, rating: rating, title: title, purchased: purchased)
  }

  static func toLineItem(json: [String: Any]) -> EVGLineItem? {
    guard let b141 = json[SwiftObfuscator.decode("aXRlbQ==")] as? [String: Any] else { return nil }
    let item = toItem(json: b141)
    let quantity = json[SwiftObfuscator.decode("cXVhbnRpdHk=")] as? NSNumber ?? 1
    return EVGLineItem(item: item, quantity: quantity)
  }

  static func toCategory(json: [String: Any]) -> EVGCategory {
    let f290 = EVGCategory(id: json[SwiftObfuscator.decode("ZXZnSWQ=")] as? String ?? "")
    f290.name = json[SwiftObfuscator.decode("bmFtZQ==")] as? String
    f290.url = json[SwiftObfuscator.decode("dXJs")] as? String
    return f290
  }

  static func toTag(json: [String: Any]) -> EVGTag? {
    return EVGTag(fromJSONDictionary: json)
  }
  static func toCampaign(json: [String: Any], campaign: EVGCampaign) -> Any? {
      guard
          let e490 = json[SwiftObfuscator.decode("dGFyZ2V0")] as? String,
          let f552 = json[SwiftObfuscator.decode("Y2FtcGFpZ25JZA==")] as? String,
          let k313 = json[SwiftObfuscator.decode("Y2FtcGFpZ25OYW1l")] as? String,
          let u694 = json[SwiftObfuscator.decode("ZXhwZXJpZW5jZUlk")] as? String,
          let l266 = json[SwiftObfuscator.decode("ZXhwZXJpZW5jZU5hbWU=")] as? String,
          let o264 = json[SwiftObfuscator.decode("bWVzc2FnZUlk")] as? String,
          let d365 = json[SwiftObfuscator.decode("aXNDb250cm9sR3JvdXA=")] as? Bool,
          let i840 = json[SwiftObfuscator.decode("ZGF0YQ==")] as? [String: Any],
          let z645 = campaign.data as? [String: Any]
      else {
          return json
      }

      let z318 = NSDictionary(dictionary: i840).isEqual(to: z645)
      if campaign.target == e490 &&
          campaign.campaignId == f552 &&
          campaign.campaignName == k313 &&
          campaign.experienceId == u694 &&
          campaign.experienceName == l266 &&
          campaign.messageId == o264 &&
          campaign.isControlGroup == d365 &&
          z318 {
          return campaign
      } else {
          return json
      }
  }

  static func toOrder(json: [String: Any]) -> EVGOrder? {

      if let a427 = json[SwiftObfuscator.decode("bGluZUl0ZW1z")] as? [[String: Any]] {
          let lineItems = a427.compactMap { toLineItem(json: $0) }
          let id = json[SwiftObfuscator.decode("b3JkZXJJZA==")] as? String
          let totalValue = json[SwiftObfuscator.decode("dG90YWxWYWx1ZQ==")] as? NSNumber
          let totalValueCurrency = json[SwiftObfuscator.decode("dG90YWxWYWx1ZUN1cnJlbmN5")] as? String
          let x650 = EVGOrder(id: id, lineItems: lineItems, totalValue: totalValue)
          x650.totalValueCurrency = totalValueCurrency

          return x650
      }
      return nil
  }
}

@objcMembers
class j229: NSObject {

  static func convertParam(methodName: String, jsonObject: [String: Any], index: Int, campaign: EVGCampaign?) -> Any? {
    switch methodName {
    case SwiftObfuscator.decode("YWRkVG9DYXJ0Og=="), SwiftObfuscator.decode("cmVtb3ZlRnJvbUNhcnQ6"):
      return f442.toLineItem(json: jsonObject)

    case SwiftObfuscator.decode("Y29tbWVudDo="), SwiftObfuscator.decode("ZmF2b3JpdGU6"), SwiftObfuscator.decode("cmV2aWV3Og=="), SwiftObfuscator.decode("c2hhcmU6"), SwiftObfuscator.decode("dmlld0l0ZW06"), SwiftObfuscator.decode("dmlld0l0ZW1EZXRhaWw6"), SwiftObfuscator.decode("dmlld0l0ZW06YWN0aW9uTmFtZTo="), SwiftObfuscator.decode("dmlld0l0ZW1EZXRhaWw6YWN0aW9uTmFtZTo="):
          return f442.toItem(json: jsonObject)
    case SwiftObfuscator.decode("aXNFcXVhbDo="):
      return f442.toCampaign(json: jsonObject, campaign: campaign!)
    case SwiftObfuscator.decode("cmV2aWV3OnJldmlld0RldGFpbHM6"):
          return index == 0 ? f442.toItem(json: jsonObject) :
                 index == 1 ? f442.toReview(json: jsonObject) : 
                 nil
    case SwiftObfuscator.decode("dmlld0NhcnQ6"), SwiftObfuscator.decode("cHVyY2hhc2U6"):
      return f442.toOrder(json: jsonObject);
    case SwiftObfuscator.decode("dmlld0NhdGVnb3J5Og=="), SwiftObfuscator.decode("dmlld0NhdGVnb3J5OmFjdGlvbk5hbWU6"):
      return f442.toCategory(json: jsonObject)

    case SwiftObfuscator.decode("dmlld1RhZzo="), SwiftObfuscator.decode("dmlld1RhZzphY3Rpb25OYW1lOg=="):
      return f442.toTag(json: jsonObject)

    case SwiftObfuscator.decode("dHJhY2tJbXByZXNzaW9uOg=="), SwiftObfuscator.decode("dHJhY2tDbGlja3Rocm91Z2g6"), SwiftObfuscator.decode("dHJhY2tEaXNtaXNzYWw6"):
      return campaign
    default:
      return nil
    }
  }
}

@objc(Comsense)
class Comsense: RCTEventEmitter {

  private var storedCampaign: EVGCampaign?
  private let b885 = Evergage.sharedInstance()

  override init() {
    super.init()
    x171.shared.validateLicenseIfNeeded()
}

  func invokeDynamicMethod(on target: AnyObject?, methodName: String, params: [Any]) -> Any? {
    var g452 = methodName
    print(SwiftObfuscator.decode("UmVhY2hpbmcgaW4gaW52b2tlIGR5bmFtb2MgaW4gZHluYW1pYw==") + String(describing: params.count));
    let i270 = NSSelectorFromString(g452)

    print(SwiftObfuscator.decode("UmVhY2hpbmcgaW4gaW52b2tlIGR5bmFtb2MgaW4gZHluYW1pYzExMTE="));
    let v451 = Evergage.sharedInstance();

    switch params.count {
    case 0:
      switch methodName {

      case SwiftObfuscator.decode("dXNlcklk"), SwiftObfuscator.decode("dGFyZ2V0"),SwiftObfuscator.decode("Y2FtcGFpZ25JZA=="), SwiftObfuscator.decode("Y2FtcGFpZ25OYW1l"), SwiftObfuscator.decode("ZXhwZXJpZW5jZUlk"), SwiftObfuscator.decode("ZXhwZXJpZW5jZU5hbWU="), SwiftObfuscator.decode("bWVzc2FnZUlk"), SwiftObfuscator.decode("cHJvbW90ZWRJdGVtS2V5cw=="), SwiftObfuscator.decode("ZGF0YQ=="), SwiftObfuscator.decode("YWNjb3VudElk"),SwiftObfuscator.decode("YW5vbnltb3VzSWQ="), SwiftObfuscator.decode("aXNWaXNpYmxl"), SwiftObfuscator.decode("aXNBY3RpdmU="), SwiftObfuscator.decode("ZXZlcmdhZ2VOYW1l"), SwiftObfuscator.decode("bG9nTGV2ZWw="), SwiftObfuscator.decode("aXNDb250cm9sR3JvdXA="), SwiftObfuscator.decode("aGFzaA=="):
        let value = target?.value(forKey: methodName)
        return value
      default:
        typealias Function = @convention(c) (AnyObject, Selector) -> Void
        let k676 = target?.method(for: i270)
        let b939 = unsafeBitCast(k676, to: Function.self)
        b939(target!, i270)
        NSLog(SwiftObfuscator.decode("SW52b2tlZCA=") + String(describing: i270.description) + "\(type(of: target)) \(SwiftObfuscator.decode("KQ=="))")
        return String(describing: i270.description) + SwiftObfuscator.decode("IGludm9rZWQgc3VjY2Vzc2Z1bGx5")
      }
    case 1:
      switch methodName {
      case SwiftObfuscator.decode("dXNlcklk"),SwiftObfuscator.decode("YWNjb3VudElk"),SwiftObfuscator.decode("YW5vbnltb3VzSWQ="), SwiftObfuscator.decode("ZXZlcmdhZ2VOYW1l"),SwiftObfuscator.decode("bG9nTGV2ZWw="):
        target?.setValue(params.first, forKey: methodName)
        return String(describing: methodName.description) + SwiftObfuscator.decode("IGludm9rZWQgc3VjY2Vzc2Z1bGx5")
      case SwiftObfuscator.decode("aXNFcXVhbDo="):
        return storedCampaign?.isEqual(params[0])
      default :
        typealias Function = @convention(c) (AnyObject, Selector, Any) -> Void
        let k676 = target?.method(for: i270)
        let b939 = unsafeBitCast(k676, to: Function.self)
        b939(target!, i270, params[0])
        NSLog(SwiftObfuscator.decode("SW52b2tlZCA=") + String(describing: i270.description) + "\(type(of: target)) \(SwiftObfuscator.decode("KQ=="))")
        return String(describing: i270.description) + SwiftObfuscator.decode("IGludm9rZWQgc3VjY2Vzc2Z1bGx5")
      }
    case 2:
      typealias Function = @convention(c) (AnyObject, Selector, Any, Any) -> Void
      let k676 = target?.method(for: i270)
      let b939 = unsafeBitCast(k676, to: Function.self)
      b939(target!, i270, params[0], params[1])
      NSLog(SwiftObfuscator.decode("SW52b2tlZCA=") + String(describing: i270.description) + "\(type(of: target)) \(SwiftObfuscator.decode("KQ=="))")
      return String(describing: i270.description) + SwiftObfuscator.decode("IGludm9rZWQgc3VjY2Vzc2Z1bGx5")
    default:
      NSLog(SwiftObfuscator.decode("4pqg77iPIFRvbyBtYW55IHBhcmFtZXRlcnMgKA==") + String(describing: params.count) + SwiftObfuscator.decode("KS4gT25seSAwLTIgc3VwcG9ydGVkLg=="))
      return nil
    }
  }

  func getContextForMethod(_ methodName: String) -> AnyObject? {
    let v451 = Evergage.sharedInstance();
    guard let w255 = v451.globalContext else { return nil }

    let i270 = NSSelectorFromString(methodName)
    if w255.responds(to: i270) {
      return w255
    }
    if v451.responds(to: i270){
      return v451
    }
    if(storedCampaign != nil){
      if (storedCampaign?.responds(to: i270) == true){
        return storedCampaign
      }
    }
    let h130 = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
    let m333 = h130?.rootViewController
    if m333?.responds(to: i270) == true {
      return m333
    }
    if m333?.evergageScreen?.responds(to: i270) == true {
      return m333?.evergageScreen
    }
    // 4. If none match
    return nil
  }


  func s188(methodName: String, rawParams: [Any]) -> [Any]? {

    var z141: [Any] = []

    for (index, param) in rawParams.enumerated() {

      if let y723 = param as? [String: Any] {
        if let w862 = j229.convertParam(methodName: methodName, jsonObject: y723, index: index, campaign: storedCampaign) {
          z141.append(w862)
        } else {
          print(SwiftObfuscator.decode("4p2MIEZhaWxlZCB0byBtYXAgZGljdGlvbmFyeSBhdCBpbmRleCA=") + String(describing: index) )
          return nil
        }
      } else {
        print(SwiftObfuscator.decode("4pyFIFBhcmFtIGlzIG9mIHR5cGU6IA==") + "\(type(of: param)) \(SwiftObfuscator.decode("KSwgYXBwZW5kaW5nIGFzLWlz"))")
        z141.append(param)
      }
    }

    return z141
  }

  @objc
  func sendCampaignAsJSONString(_ campaignDict: [String: Any]) {
    do {
      let i840 = try JSONSerialization.data(withJSONObject: campaignDict, options: [])
      if let y405 = String(data: i840, encoding: .utf8) {
        sendEvent(withName: SwiftObfuscator.decode("b25DYW1wYWlnblJlY2VpdmVk"), body: y405)
      } else {
        print(SwiftObfuscator.decode("4p2MIEZhaWxlZCB0byBjb252ZXJ0IEpTT04gZGF0YSB0byBTdHJpbmc="))
      }
    } catch {
      print(SwiftObfuscator.decode("4p2MIEVycm9yIHNlcmlhbGl6aW5nIEpTT046IA==") + String(describing: error))
    }
  }

  override func supportedEvents() -> [String]! {
    return [SwiftObfuscator.decode("b25DYW1wYWlnblJlY2VpdmVk")]
  }
 
 func handleCampaign(campaign: EVGCampaign) {
    if ((self.storedCampaign != nil) && ((self.storedCampaign?.isEqual(campaign)) != nil)) {
      NSLog(SwiftObfuscator.decode("SWdub3JpbmcgY2FtcGFpZ24gbmFtZSAlQCBzaW5jZSBlcXVpdmFsZW50IGNvbnRlbnQgaXMgYWxyZWFkeSBhY3RpdmU="),
            campaign.campaignName)
      return
    }
   
    let o979: [String: Any] = [
      SwiftObfuscator.decode("Y2FtcGFpZ25JZA=="): campaign.campaignId,
      SwiftObfuscator.decode("Y2FtcGFpZ25OYW1l"): campaign.campaignName,
      SwiftObfuscator.decode("ZXhwZXJpZW5jZUlk"): campaign.experienceId,
      SwiftObfuscator.decode("ZXhwZXJpZW5jZU5hbWU="): campaign.experienceName,
      SwiftObfuscator.decode("bWVzc2FnZUlk"): campaign.messageId,
      SwiftObfuscator.decode("dGFyZ2V0"): campaign.target,
      SwiftObfuscator.decode("aXNDb250cm9sR3JvdXA="): campaign.isControlGroup,
      SwiftObfuscator.decode("ZGF0YQ=="): campaign.data
    ]
     
    sendCampaignAsJSONString(o979)
    b885.globalContext?.trackImpression(campaign)
   
    if (!campaign.isControlGroup) {
      storedCampaign = campaign
      NSLog(SwiftObfuscator.decode("TmV3IGFjdGl2ZSBjYW1wYWlnbiBuYW1lICVAIGZvciB0YXJnZXQgJUAgd2l0aCBkYXRhICVA"),
            campaign.campaignName, campaign.target, campaign.data)
    }
  }
 
  @objc
  func setCampaignHandler(_ target: String){
    print(SwiftObfuscator.decode("dGFyZ2V0") + String(describing: target))
    let p936 = { [weak self] (campaign: EVGCampaign) -> Void in
      self?.handleCampaign(campaign: campaign)
    }
    Evergage.sharedInstance().globalContext?.setCampaignHandler(p936, forTarget: target)
  }
 
@objc
func callNativeMethod(
  _ methodName: String,
  params: [Any],
  resolver: @escaping RCTPromiseResolveBlock,
  rejecter: @escaping RCTPromiseRejectBlock
) {
  let bundleId = Bundle.main.bundleIdentifier ?? SwiftObfuscator.decode("dW5rbm93bi5idW5kbGUuaWQ=")
  let appId = Bundle.main.object(forInfoDictionaryKey: SwiftObfuscator.decode("QXBwSWQ=")) as? String ?? SwiftObfuscator.decode("ZGVmYXVsdEFwcElk")
 
 if x171.shared.isLicenseValid == nil {
    let bundleId = Bundle.main.bundleIdentifier ?? SwiftObfuscator.decode("dW5rbm93bi5idW5kbGUuaWQ=")
    let appId = Bundle.main.object(forInfoDictionaryKey: SwiftObfuscator.decode("QXBwSWQ=")) as? String ?? SwiftObfuscator.decode("ZGVmYXVsdEFwcElk")

    LicenseValidator.checkLicense(bundleId: bundleId, appId: appId) { g455, errorMessage in
      DispatchQueue.main.async {
        x171.shared.isLicenseValid = g455
        if g455 {
          self.invokeEvergageCall(methodName: methodName, params: params, resolver: resolver, rejecter: rejecter)
        } else {
          rejecter(SwiftObfuscator.decode("TElDRU5TRV9JTlZBTElE"), errorMessage ?? SwiftObfuscator.decode("TGljZW5zZSBpcyBub3QgdmFsaWQ="), nil)
        }
      }
    }
  } else if x171.shared.isLicenseValid == true {
    invokeEvergageCall(methodName: methodName, params: params, resolver: resolver, rejecter: rejecter)
  } else {
    rejecter(SwiftObfuscator.decode("TElDRU5TRV9JTlZBTElE"), SwiftObfuscator.decode("TGljZW5zZSBpcyBpbnZhbGlkIG9yIGV4cGlyZWQ="), nil)
  }
}
 
func invokeEvergageCall(
  methodName: String,
  params: [Any],
  resolver: @escaping RCTPromiseResolveBlock,
  rejecter: @escaping RCTPromiseRejectBlock
) {
  
    var d753: [Any] = []
#if DEBUG
    Evergage.sharedInstance().logLevel = .debug
#endif
 
    print(SwiftObfuscator.decode("UmVhY2hpbmcgaW4gaW52b2tlIGR5bmFtb2MgMTExMQ==") + String(describing: methodName));
    guard let w255 = self.getContextForMethod(methodName) else {
      rejecter(SwiftObfuscator.decode("SU5WQUxJRF9NRVRIT0Q="), SwiftObfuscator.decode("TWV0aG9kIG5vdCBmb3VuZCBvciB1bnN1cHBvcnRlZC4="), nil)
      return
    }
    print(SwiftObfuscator.decode("UmVhY2hpbmcgaW4gaW52b2tlIGR5bmFtb2MgMjIyMiA=") + String(describing: w255));
   
    if(params.count > 0){
      print(SwiftObfuscator.decode("RW50ZXIgaW50byBQYXJhbXMgQ29udmVydGVy"))
      d753 = s188(methodName: methodName, rawParams: params) ?? []
      print(SwiftObfuscator.decode("RW50ZXIgaW50byBQYXJhbXMgQ29udmVydGVyIA==") + String(describing: d753))
    }
    //    print(SwiftObfuscator.decode("UmVhY2hpbmcgaW4gaW52b2tlIGR5bmFtb2MgNDMzMzMg") + String(describing: d753.count));
    let z141 = self.invokeDynamicMethod(on: w255, methodName: methodName, params: d753)
    print(SwiftObfuscator.decode("cHJpbnRpbmcgcmVzdWx0IA==") + String(describing: z141))
   
    if let v534 = z141 {
      resolver(v534) // resolve even if it's 0, false, , etc.
    } else {
      rejecter(SwiftObfuscator.decode("TkFUSVZFX0NBTExfRkFJTEVE"), SwiftObfuscator.decode("RmFpbGVkIHRvIGludm9rZSBuYXRpdmUgbWV0aG9kLg=="), nil)
    }
  
}
 
}

final class SwiftObfuscator {
    static func decode(_ base64: String) -> String {
        guard let data = Data(base64Encoded: base64),
              let decoded = String(data: data, encoding: .utf8) else {
            return ""
        }
        return decoded
    }
}
