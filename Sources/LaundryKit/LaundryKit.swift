import APIKit
import Combine

enum LaundryEndpoints: APIResource {
    
    case locations
    
    var method: HTTPMethod {
        switch self {
        case .locations: return .GET
        }
    }
    
    var endpoint: String {
        switch self {
        case .locations: return "/laundry"
        }
    }
    
    var base: String {
        return "https://purdue-app-server.herokuapp.com/api/v1"
    }
    
    var parameters: [String : String]? {
        return nil;
    }
    
}

public struct LaundryRoom: Decodable {
    let name: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "laundryName"
        case id = "laundryId"
    }
}

@available(iOS 13.0, *)
public struct LaundryService {
    
    static func getLaundryLocations() -> Publishers.Future<[LaundryRoom], APIError> {
        return APIRequest.getResource(from: LaundryEndpoints.locations, with: EmptyBody(), get: [LaundryRoom].self)
    }
    
}
