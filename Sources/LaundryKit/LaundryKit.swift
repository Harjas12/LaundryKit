import APIKit
import Combine

public enum LaundryEndpoints: APIResource {
    
    case locations
    
    public var method: HTTPMethod {
        switch self {
        case .locations: return .GET
        }
    }
    
    public var endpoint: String {
        switch self {
        case .locations: return "/laundry"
        }
    }
    
    public var base: String {
        return "https://purdue-app-server.herokuapp.com/api/v1"
    }
    
    public var parameters: [String : String]? {
        return nil
    }
    
}

public struct LaundryRoom: Decodable {
    public let name: String
    public let id: String
    
    public init(name: String, id: String) {
        self.name = name
        self.id = id
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "laundryName"
        case id = "laundryId"
    }
}

@available(iOS 13.0, *)
public struct LaundryService {
    
    public static func getLaundryLocations() -> Future<[LaundryRoom], APIError> {
        return APIRequest.getResource(from: LaundryEndpoints.locations, get: [LaundryRoom].self)
    }
    
}
