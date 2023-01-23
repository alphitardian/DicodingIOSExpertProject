//
//  File.swift
//  
//
//  Created by Ardian Pramudya Alphita on 06/01/23.
//

public struct BaseMealResponse<T: Codable>: Codable {
    public var meals: [T]
}
