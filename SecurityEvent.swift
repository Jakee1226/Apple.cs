importFoundation

struct SecurityEvent: Codable{
    let eventID: String//事件編號方便追蹤
    let timestamp: String
    let source: String//誰產生的事件
    let action: String//read write upload
    let target: String
    let result: String
    let isSimulated: Bool//用來區分true false

    enum CodingKeys: String CodingKey{
        case eventID ="event_id"
        case timestamp,source,action, target, result
        case isSimulated="is_simulated"
    }
    static func nowTimestamp() -> String {//自動取得現在時間
        let f = ISO8601DateFormatter()
        f.timeZone = TimeZone.current
        f.formatOptions = [.withInternetDateTime]
        return f.string(from: Date())
    }

    func jsonString() -> String {//把swift裡的SecurityEvent變JSON
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        guard let data = try? encoder.encode(self),
              let text = String(data: data, encoding: .utf8) else {
            return "{}"
        }
        return text
    }
}

//統整抓到事件 → 按規定記下來 → 變成 JSON → 給後面的 C 分析