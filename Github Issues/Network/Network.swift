//
//  Network.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation
import Alamofire

class Network {
    
    static func perform<T: Decodable>(request urlRequest: Router, completion: @escaping (GIResult<[T]>) -> ()) {
        AF.request(urlRequest).responseJSON { (response) in
            
            #if DEBUG
                debugPrint(response)
            #endif
            
            guard response.error == nil else {
                let statusCode = response.response?.statusCode
                
                let error = GIError.backendError(response.error!.localizedDescription, statusCode)
                completion(.failure(error))
                return
            }
            
            do {
                guard let json = try response.result.get() as? [[String: Any]] else {
                    return
                }
                
                let data = try JSONSerialization.data(withJSONObject: json, options: [])
                
                let decoder = JSONDecoder()
                
                if let context = CodingUserInfoKey.context {
                    decoder.userInfo[context] = PersistenceManager.shared.context
                }
                
                let value = try decoder.decode([T].self, from: data)
                completion(GIResult.success(value))
                
            } catch {
                print("INCORRECT JSON FORMAT:", error.localizedDescription)
                
                let error = GIError.incorrectFormat(Constants.Strings.somethingWentWrong)
                completion(GIResult.failure(error))
            }
        }
    }
}
