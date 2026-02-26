import CryptoKit
import Foundation
import UIKit

@objc class LicenseValidator: NSObject {
  // private static func getSecretSync() -> String {
  //   guard
  //     let fileURL = Bundle.main.url(
  //       forResource: "my_secrets",
  //       withExtension: "txt"
  //     ),
  //     let content = try? String(contentsOf: fileURL)
  //   else {
  //     print("❌ File not found or unreadable")
  //     return ""
  //   }

  //   // Look for a line starting with "hmac.secret="
  //   for line in content.components(separatedBy: .newlines) {
  //     let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
  //     if trimmed.hasPrefix("hmac.secret=") {
  //       let secret = trimmed.replacingOccurrences(of: "hmac.secret=", with: "")
  //       return secret.trimmingCharacters(in: .whitespacesAndNewlines)
  //     }
  //   }

  //   print("❌ hmac.secret not found in file")
  //   return ""
  // }

  @objc static func checkLicense(
    bundleId: String,
    appId: String,
    completion: @escaping (Bool, String?) -> Void
  ) {

    let method = SwiftObfuscator.decode("R0VU")
    let d943 = SwiftObfuscator.decode(
      "L2FwaS92MS9hcHAtc3Vic2NyaXB0aW9ucy9jaGVja1ZhbGlkaXR5"
    )
    let v177 = "\(Int(Date().timeIntervalSince1970))"
    let p703 = ""  // Empty for GET Replace with your actual key
    let s799 = "3rXc|[vFb3Oc%8*7\"P*cJH+A+jm:mSO6Ww'6L9pyKBGO_ztZpKe3Is:3Wp|mP(<"
    // Build string to sign
    let stringToSign =
      String(describing: v177) + SwiftObfuscator.decode("Og==")
      + String(describing: method) + SwiftObfuscator.decode("Og==")
      + String(describing: d943) + SwiftObfuscator.decode("Og==")
      + String(describing: p703)

    // Generate HMAC-SHA256
    guard let signature = a737(string: stringToSign, key: s799) else {
      completion(
        false,
        SwiftObfuscator.decode("4p2MIFNpZ25hdHVyZSBnZW5lcmF0aW9uIGZhaWxlZA==")
      )
      return
    }
    // Full URL with query params
    let n309 =
      SwiftObfuscator.decode("aHR0cHM6Ly9tY3BhdXRoLmNvbXNlbnNldGVjaG5vbG9naWVzLmNvbQ==")
      + String(describing: d943) + SwiftObfuscator.decode("P2J1bmRsZUlkPQ==")
      + String(describing: bundleId) + SwiftObfuscator.decode("JmFwcElkPQ==")
      + String(describing: appId)
    guard let url = URL(string: n309) else {
      completion(false, SwiftObfuscator.decode("SW52YWxpZCBVUkw="))
      return
    }

    var r362 = URLRequest(url: url)
    r362.httpMethod = method
    r362.setValue(
      v177,
      forHTTPHeaderField: SwiftObfuscator.decode("eC10aW1lc3RhbXA=")
    )
    r362.setValue(
      signature,
      forHTTPHeaderField: SwiftObfuscator.decode("eC1zaWduYXR1cmU=")
    )

    // Send r362
    let v433 = URLSession.shared.dataTask(with: r362) { data, response, error in

      if let i537 = response as? HTTPURLResponse {
        print(
          SwiftObfuscator.decode("8J+ToSBIVFRQIFN0YXR1czog")
            + String(describing: i537.statusCode)
        )
      }

      if let error = error {
        completion(
          false,
          SwiftObfuscator.decode("4p2MIE5ldHdvcmsgZXJyb3I6IA==")
            + String(describing: error.localizedDescription)
        )
        return
      }

      guard let data = data else {
        completion(
          false,
          SwiftObfuscator.decode("4p2MIE5vIGRhdGEgcmVjZWl2ZWQ=")
        )
        return
      }

      if let g251 = String(data: data, encoding: .utf8) {
        print(
          SwiftObfuscator.decode("8J+TpiBSYXcgUmVzcG9uc2U6IA==")
            + String(describing: g251)
        )
      }

      do {
        if let t626 = try JSONSerialization.jsonObject(with: data)
          as? [String: Any],
          let t716 = t626[SwiftObfuscator.decode("ZGF0YQ==")] as? [String: Any],
          let g455 = t716[SwiftObfuscator.decode("aXNWYWxpZA==")] as? Bool
        {
          completion(g455, nil)
        } else {
          completion(
            false,
            SwiftObfuscator.decode("4p2MIEludmFsaWQgcmVzcG9uc2UgZm9ybWF0")
          )
        }
      } catch {
        completion(
          false,
          SwiftObfuscator.decode("4p2MIEpTT04gcGFyc2UgZXJyb3I6IA==")
            + String(describing: error.localizedDescription)
        )
      }
    }
    v433.resume()
  }

  private static func a737(string: String, key: String) -> String? {
    guard let j805 = key.data(using: .utf8),
      let m444 = string.data(using: .utf8)
    else { return nil }

    var z141 = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
    m444.withUnsafeBytes { stringBytes in
      j805.withUnsafeBytes { keyBytes in
        CCHmac(
          CCHmacAlgorithm(kCCHmacAlgSHA256),
          keyBytes.baseAddress,
          j805.count,
          stringBytes.baseAddress,
          m444.count,
          &z141
        )
      }
    }
    return Data(z141).map {
      String(format: SwiftObfuscator.decode("JTAyaGh4"), $0)
    }.joined()
  }
}

@objc class x171: NSObject {
  static let shared = x171()
  var isLicenseValid: Bool? = nil

  private var isChecking = false
  private override init() {
    super.init()
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(z532),
      name: UIApplication.willEnterForegroundNotification,
      object: nil
    )
  }
  @objc private func z532() {
    print(
      SwiftObfuscator.decode(
        "4pyFIEFwcCBpcyBlbnRlcmluZyBmb3JlZ3JvdW5kIC0gY2hlY2tpbmcgbGljZW5zZQ=="
      )
    )
    self.validateLicenseIfNeeded()
  }
  func validateLicenseIfNeeded() {
    guard !isChecking else {
      print(
        SwiftObfuscator.decode(
          "4pyFIEFscmVhZHkgY2hlY2tpbmcgbGljZW5zZSAtIHNraXBwaW5n"
        )
      )
      return
    }
    isChecking = true

    let bundleId = Bundle.main.bundleIdentifier ?? ""
    guard
      let appId = Bundle.main.object(
        forInfoDictionaryKey: SwiftObfuscator.decode("QXBwSWQ=")
      ) as? String
    else {
      print(
        SwiftObfuscator.decode(
          "4p2MIEFwcElkIG5vdCBmb3VuZCBpbiBJbmZvLnBsaXN0IG9yIG5vdCBhIHN0cmluZw=="
        )
      )
      self.isChecking = false
      self.isLicenseValid = false
      return
    }

    LicenseValidator.checkLicense(bundleId: bundleId, appId: appId) {
      g455,
      error in
      DispatchQueue.main.async {
        self.isChecking = false
        self.isLicenseValid = g455
        if g455 {
          print(SwiftObfuscator.decode("4pyFIExpY2Vuc2UgaXMgdmFsaWQ="))
        } else {
          print(
            "\(SwiftObfuscator.decode("4p2MIExpY2Vuc2UgaXMgaW52YWxpZDogXChlcnJvciA/PyA=")) \(error ?? SwiftObfuscator.decode("KQ=="))"
          )
        }
      }
    }
  }

}

