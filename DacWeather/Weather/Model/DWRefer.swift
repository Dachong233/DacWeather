//
//  DWRefer.swift
//  DacWeather
//
//  Created by zhangzicong on 2022/5/14.
//

import Foundation

// MARK: - DWRefer
struct DWRefer: Codable {
    let sources, license: [String]?
}

// MARK: DWRefer convenience initializers and mutators

extension DWRefer {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(DWRefer.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        sources: [String]?? = nil,
        license: [String]?? = nil
    ) -> DWRefer {
        return DWRefer(
            sources: sources ?? self.sources,
            license: license ?? self.license
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
