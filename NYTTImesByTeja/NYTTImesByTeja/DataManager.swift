//
//  DataManger.swift
//  AllPracticeConcepts
//
//  Created by TejaDanasvi on 2/10/21.
//

import Foundation

class DataManager {
    static func getServerData<T: Decodable>(str: String, type: T.Type, completionHandler: @escaping (_ obj:T?, _ error: Error? )  -> ())  {
        guard let url = URL(string: str) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data,
                   error == nil {
                do {
                    let userResponse = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(userResponse, nil)
                } catch let err {
                    completionHandler(nil, err)
                }
            } else {
                completionHandler(nil, error)
            }
        }.resume()
    }
}
