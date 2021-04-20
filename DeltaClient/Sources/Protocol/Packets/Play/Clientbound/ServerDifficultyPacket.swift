//
//  ServerDifficultyPacket.swift
//  DeltaClient
//
//  Created by Rohan van Klinken on 3/1/21.
//

import Foundation

struct ServerDifficultyPacket: ClientboundPacket {
  static let id: Int = 0x0d
  
  var difficulty: Difficulty
  var isLocked: Bool
  
  init(from packetReader: inout PacketReader) throws {
    guard let difficulty = Difficulty(rawValue: packetReader.readUnsignedByte()) else {
      throw ClientboundPacketError.invalidDifficulty
    }
    self.difficulty = difficulty
    isLocked = packetReader.readBool()
  }
  
  func handle(for server: Server) throws {
    server.difficulty = difficulty
    server.isDifficultyLocked = isLocked
  }
}
