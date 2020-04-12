//
//  NetworkManager.swift
//  NaveenAsyncTableView
//
//  Created by Naveen Chandra on 12/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import UIKit


    /// Result enum is a generic for any type of value
    /// with success and failure case
    public enum Result<T> {
        case success(T)
        case failure(Error)
    }

    final class NetworkManager: NSObject {
        
        // MARK: - Private functions
        private static func getData(url: URL,
                                    completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        // MARK: - Public functions
        
        /// fetchNews function will fetch the news stories and returns
        /// Result<DemoModel> as completion handler
        public static func fetchData(shouldFail: Bool = false, completion: @escaping (Result<DemoModel>) -> Void) {
           
            let mainUrlString = EndPoints.APIUrl.rawValue
            
            
            guard let url = URL(string: mainUrlString)else{return }
            
            NetworkManager.getData(url: url) { (data, response, error) in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, error == nil else { return }
                
                do {
                   let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
                    guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                          print("could not convert data to UTF-8 format")
                          return
                     }
//                    let json1 = try JSONSerialization.jsonObject(with: modifiedDataInUTF8Format, options: []) as? [String : Any]
//
//                    print(json1)
                        let decoder = JSONDecoder()
                        let json = try decoder.decode(DemoModel.self, from: modifiedDataInUTF8Format)
                           completion(.success(json))
                   
                } catch let error {
                    completion(.failure(error))
                }
            }
        }
        
        /// downloadImage function will download the thumbnail images
        /// returns Result<Data> as completion handler
        public static func downloadImage(url: URL,
                                         completion: @escaping (Result<Data>) -> Void) {
            NetworkManager.getData(url: url) { data, response, error in
                
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data, error == nil else {
                    return
                }
                
                DispatchQueue.main.async() {
                    completion(.success(data))
                }
            }
        }
    }



