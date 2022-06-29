

import Foundation


class Manager {
    
    static let shared = Manager()
    
    
    func sendNotification() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            NotificationCenter.default.post(name: .internetDown, object: nil, userInfo: nil) // send
        }
}
    
    
    func sendRequest(completion: @escaping (String)->()) {
        
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        let first = json.first as? [String: Any]
                        let body = first?["body"] as? String
                        completion(body ?? "")
                    }
                } catch let error {
                    print(error)
                }
            }
        }
        task.resume()
    }
}
