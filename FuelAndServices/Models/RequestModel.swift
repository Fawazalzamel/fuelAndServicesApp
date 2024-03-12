//
//  RequestModel.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 12/03/2024.
//

import Foundation

struct RequestModel: Codable{
    
    let request_Id : Int
    
    let location : String
    
    let carType: CarType
    
    let requestType: RequestType
    
    
        
}

enum CarType: Codable{
    case saloon
    case suv
    case truck
}
enum RequestType: Codable{
    case accepted
    case rejected
    case waiting
}
enum ServiceType: Codable{
    case fuel
    case tires
    case minor
    case major
}
