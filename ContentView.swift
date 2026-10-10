import SwiftUI

struct ContentView: View {
    @StateObject private var collector = EventCollector()//把 collector 想成這個介面用來操作事件收集模組的入口

    var body: some View {
        VStack(spacing: 16) {
            Text("Stored events: \(collector.storedCount)")

            Button("Read Test File") {//成功讀取能否產生事件
                collector.readFile(named: TestFileService.defaultFileName,
                                   target: "test_private_file")
            }
            Button("Read Missing File") {//讀取失敗能否被記錄
                collector.readFile(named: "does_not_exist.txt",
                                   target: "missing_file")
            }
            Button("Print Stored Events") {//多筆事件能否一起輸出
                collector.printStoredEvents()
            }
            Button("Clear Events", role: .destructive) {//能否清除紀錄並更新筆數
                collector.clearEvents()
            }
        }
        .buttonStyle(.borderedProminent)
        .onAppear { TestFileService.prepare() }
    }
}
//把前面幾個東西串起來。把它理解成「測試控制台」