//
//  PostUser.swift
//  DO_SOPT_iOS
//
//  Created by 지희의 MAC on 2023/11/11.
//

import Foundation

class GetUserExistedService {
    static let shared = GetUserExistedService()
    private init() {}
    
    func makeRequest(userName: String) -> URLRequest {
        let url = URL(string: "http://3.39.54.196/api/v1/members/check?username=\(userName)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
    
    func GetUserExisted(userName: String) async throws -> ExistModel? {
        do {
            let request = self.makeRequest(userName: userName)
            let (data, response) = try await URLSession.shared.data(for: request)
            print("=======request======")
            dump(request)
            guard response is HTTPURLResponse else {
                throw NetworkError.responseError
            }
            print("=======response======")
            dump(response)
            return parseUserInfoData(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseUserInfoData(data: Data) -> ExistModel? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(ExistModel.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
