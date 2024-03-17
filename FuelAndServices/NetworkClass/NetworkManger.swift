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
    private let requestList = "/request_list"
    
    private let signinEndAuth = "/signin"
    private let signupEndAuth = "/signup"
    
    static let shared = NetworkManger()
    
    func signup(user: UserModel, completion: @escaping (Result<Void, Error>) -> Void) {
       let url = baseURLAuth + signupEndAuth
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).response { response in
            
            if let error = response.error {
                completion(.failure(error))
            } else {
                completion(.success(()))

            }
            
//           switch response.result {
//           case .success(let value):
//               completion(.success(value))
//           case .failure(let afError):
//               completion(.failure(afError as Error))
//           }
       }
   }
   

    func signIn(user: UserModel, completion: @escaping (Result<TokenResponse, Error>) -> Void) {
       let url = baseURLAuth + signinEndAuth
       
       AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).responseDecodable(of: TokenResponse.self) { response in
           switch response.result {
           case .success(let value):
               completion(.success(value))
           case .failure(let afError):
               // EXTRA LINE FOR DEBUGGING
                if let data = response.data, let str = String(data: data, encoding: .utf8) {
                    print("Raw response: \(str)")
                }
               completion(.failure(afError))
           }
       }
   }
    //service ID req param
    //request model req body
    func addRequest(token: String, request: RequestModel, service_Id: Int, completion: @escaping (Bool) -> Void) {
        print("network: \(token)")
        let url = baseURLUser + addRequestUser + "?service_Id=\(service_Id)"
        print(url)
        let headers: HTTPHeaders = ["Authorization" : token]
        
            AF.request(url, method: .post, parameters: request, encoder: JSONParameterEncoder.default, headers: headers).response { response in
                switch response.result {
                case .success(_):
                    if let data = response.data, let str = String(data: data, encoding: .utf8) {
                                    print("SSs Raw response: \(str)")
                                }
                    completion(true)
                case .failure(let error):
                    if let data = response.data, let str = String(data: data, encoding: .utf8) {
                                    print("Raw response: \(str)")
                                }
                    print(error)
                    completion(false)
                }
            }
        }
    
}
