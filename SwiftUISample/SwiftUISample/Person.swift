//Created by Purva Bhureja

import SwiftUI

// Codable for Person
public struct Person: Codable {
  public var name: String?
  public var info: Info?
}

// Codable for Info
public struct Info: Codable {
  public var title: String?
  public var age: Int?
  public var phone: String?
  public var email: String?
}


