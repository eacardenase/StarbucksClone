//
//  HistoryService.swift
//  StarbucksClone
//
//  Created by Edwin Cardenas on 9/4/25.
//

import Foundation

enum ServiceError: Error {
    case server
    case decoding
}

struct HistoryService {

    private init() {}

    static func fetchTransactions(
        completion: @escaping (Result<[Transaction], Error>) -> Void
    ) {
        guard
            let url = URL(
                string:
                    "https://uwyg0quc7d.execute-api.us-west-2.amazonaws.com/prod/history"
            )
        else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }

                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completion(.failure(ServiceError.server))

                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            do {
                let result = try decoder.decode(History.self, from: data)

                DispatchQueue.main.async {
                    completion(.success(result.transactions))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(ServiceError.decoding))
                }
            }
        }.resume()
    }

}
