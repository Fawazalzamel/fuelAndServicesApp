//
//  NetworkManger.swift
//  FuelAndServices
//
//  Created by Fawaz Alzamel on 11/03/2024.
//

import Foundation
import Alamofire

class NetworkManger{
    
    private let baseURLUser = "http://localhost:8080/api/v1/user"
    private let baseURLAuth = "http://localhost:8080/api/v1/auth"
    
    private let updateUser = "/update-user"
    private let addRequestUser = "/add-request"
    private let requestList = "/request-list"
    
    private let signinEndAuth = "/signin"
    private let signupEndAuth = "/signup"
    
    static let shared = NetworkManger()
    
    func signup(user: UserModel, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
       let url = baseURLAuth + signupEndAuth
       AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               completion(.failure(afError as Error))
           }
       }
   }
   

    func signIn(user: UserModel, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
       let url = baseURLAuth + signinEndAuth
       
       AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               completion(.failure(afError))
           }
       }
   }
    
    
}
