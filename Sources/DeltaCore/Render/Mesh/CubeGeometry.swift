//
//  CubeGeometry.swift
//  DeltaCore
//
//  Created by Rohan van Klinken on 10/6/21.
//

import Foundation
import simd

struct CubeGeometry {
  static let faceWinding: [UInt32] = [0, 1, 2, 2, 3, 0]
  
  static let faceVertexIndices: [FaceDirection: [Int]] = [
    .up: [3, 7, 4, 0],
    .down: [6, 2, 1, 5],
    .east: [3, 2, 6, 7],
    .west: [4, 5, 1, 0],
    .north: [0, 1, 2, 3],
    .south: [7, 6, 5, 4]]
  
  static let cubeVertices: [simd_float3] = [
    simd_float3([0, 1, 0]),
    simd_float3([0, 0, 0]),
    simd_float3([1, 0, 0]),
    simd_float3([1, 1, 0]),
    simd_float3([0, 1, 1]),
    simd_float3([0, 0, 1]),
    simd_float3([1, 0, 1]),
    simd_float3([1, 1, 1])]
  
  static let faceVertices: [FaceDirection: [simd_float3]] = [
    .up: CubeGeometry.generateFaceVertices(facing: .up),
    .down: CubeGeometry.generateFaceVertices(facing: .down),
    .east: CubeGeometry.generateFaceVertices(facing: .east),
    .west: CubeGeometry.generateFaceVertices(facing: .west),
    .north: CubeGeometry.generateFaceVertices(facing: .north),
    .south: CubeGeometry.generateFaceVertices(facing: .south)]
  
  static func generateFaceVertices(facing: FaceDirection) -> [simd_float3] {
    let vertexIndices: [Int]
    switch facing {
      case .up: vertexIndices = [3, 7, 4, 0]
      case .down: vertexIndices = [6, 2, 1, 5]
      case .east: vertexIndices = [3, 2, 6, 7]
      case .west: vertexIndices = [4, 5, 1, 0]
      case .north: vertexIndices = [0, 1, 2, 3]
      case .south: vertexIndices = [7, 6, 5, 4]
    }
    let vertices = vertexIndices.map { index in
      return cubeVertices[index]
    }
    return vertices
  }
}