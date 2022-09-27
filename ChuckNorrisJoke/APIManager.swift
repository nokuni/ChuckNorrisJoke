//
//  APIManager.swift
//  ChuckNorrisJoke
//
//  Created by Maertens Yann-Christophe on 27/09/22.
//

import Foundation

@MainActor
class APIManager {
    
    // Manage the possible errors from the request.
    enum APIError: String {
        case wrongURL = "The URL provided for the request is wrong."
        case badResponse = "The server does not respond correctly."
        case noData = "There is no data to get."
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case head = "HEAD"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case connect = "CONNECT"
        case options = "OPTIONS"
        case trace = "TRACE"
        case patch = "PATCH"
    }
    
    // Request data from an URL.
    func request<M: Codable>(url: URL?, httpMethod: HTTPMethod, cachePolicy: URLRequest.CachePolicy, model: M.Type) async throws -> M {
        
        guard let url = url else { throw APIError.wrongURL.rawValue }
        
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = httpMethod.rawValue
        
        do {
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else { throw APIError.badResponse.rawValue }
            
            let result = try JSONDecoder().decode(M.self, from: data)
            
            return result
            
        } catch {
            throw APIError.noData.rawValue
        }
    }
}
