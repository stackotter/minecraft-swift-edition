//
//  MojangBlockModelAxis.swift
//  DeltaClient
//
//  Created by Rohan van Klinken on 3/7/21.
//

import Foundation
import DeltaCore

/// An enum used when decoding Mojang formatted block models.
public enum MojangBlockModelAxis: String, Codable {
  case x
  case y
  case z
  
  /// This axis in the normal format.
  var axis: Axis {
    switch self {
      case .x:
        return .x
      case .y:
        return .y
      case .z:
        return .z
    }
  }
}
