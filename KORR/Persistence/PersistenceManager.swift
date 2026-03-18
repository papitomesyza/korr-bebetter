import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private init() {}

    private func url(for key: String) -> URL {
        let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return folder.appendingPathComponent("\(key).json")
    }

    func save<T: Codable>(_ value: T, key: String) {
        do {
            let data = try encoder.encode(value)
            try data.write(to: url(for: key), options: .atomic)
        } catch {
            print("Persistence save error \(key): \(error)")
        }
    }

    func load<T: Codable>(_ type: T.Type, key: String) -> T? {
        do {
            let data = try Data(contentsOf: url(for: key))
            return try decoder.decode(type, from: data)
        } catch {
            return nil
        }
    }
}
