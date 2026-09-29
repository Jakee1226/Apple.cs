import  Foundation
print("Hello, 這是我的第一個 iOS 本地 AI 專案！")

// 模擬一個簡單的本地 AI 處理函式
func runLocalAI(input: String) -> String {
    let result = "AI 收到你的訊息：「\(input)」正在本地端處理中..."
    return result
}

let response = runLocalAI(input: "你好")
print(response)