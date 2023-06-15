//
//  NetworkProvider.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case requestFailed
}

class NetworkProvider {
    private let session: URLSession
    private let apiKey: String
    static let shared = NetworkProvider()
    private init() {
        let configuration = URLSessionConfiguration.default
        self.session = URLSession(configuration: configuration)
        self.apiKey = "3I5Zpu54pvsEqW5CernwdtR8jrX4AXbQSe6k5F4r"
    }
    func getTopCurrencies(completion: @escaping (Result<[Currency], Error>) -> Void) {
        guard let url = URL(string: "https://api.freecurrencyapi.com/v1/currencies?apikey=\(apiKey)&currencies=USD%2CEUR%2CGBP%2CRUB%2CCNY") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        //        request.setValue(apiKey, forHTTPHeaderField: "apikey")
        let task = session.dataTask(with: request) { data, response, error in
#if DEBUG
            //            if let response: HTTPURLResponse = response as? HTTPURLResponse {
            //                print("====RESPONSE====")
            //                print("---")
            //                print("\(response.statusCode) - \(String(describing: response.url))")
            //                print("---")
            //                print("Headers:")
            //                for (key, val) in response.allHeaderFields {
            //                    print( "> \(key): \(val)")
            //                }
            //                print("---")
            //                print("Body:")
            //                if let x = data {
            //                    print(String.init(data: x, encoding: .utf8)!)
            //                    //                }
            //                    print("---")
            //                    print("==END RESPONSE==")
            //                }
            //            }
#endif
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                completion(.failure(NetworkError.requestFailed))
                return
            }
            do {
                let decoder = JSONDecoder()
                //                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let currenciesDict = try decoder.decode(CurrencyData.self, from: data)
                let currencies = Array(currenciesDict.data.values)
                completion(.success(currencies))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    func getTRYHistory(of code: String, completion: @escaping (Result<TRYHistory, Error>) -> Void) {
        guard let url = URL(string: "https://api.freecurrencyapi.com/v1/historical?apikey=\(apiKey)&currencies=TRY&base_currency=\(code)&date_from=\(Date().getTwoDaysBeforeDateString())T19%3A42%3A03.126Z&date_to=\(Date().getPreviousDateString())T19%3A42%3A03.129Z") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
#if DEBUG
//            if let response: HTTPURLResponse = response as? HTTPURLResponse {
//                print("====RESPONSE====")
//                print("---")
//                print("\(response.statusCode) - \(String(describing: response.url))")
//                print("---")
//                print("Headers:")
//                for (key, val) in response.allHeaderFields {
//                    print( "> \(key): \(val)")
//                }
//                print("---")
//                print("Body:")
//                if let x = data {
//                    print(String.init(data: x, encoding: .utf8)!)
//                    //                }
//                    print("---")
//                    print("==END RESPONSE==")
//                }
//            }
#endif
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                completion(.failure(NetworkError.requestFailed))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let currencHistory = try decoder.decode(TRYHistory.self, from: data)
                completion(.success(currencHistory))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
