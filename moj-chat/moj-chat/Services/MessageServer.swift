import Foundation
import Alamofire
import SwiftyJSON
class MessageServer {
    static let instance = MessageServer()
    
    var channels = [Channel]()
    var selectedChannel: Channel?
    var unreadChannels = [Channel]()
    var messages = [Message]()
    
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_FIND_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: bearerHeader).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else { return }
                do {
                    self.channels = try JSONDecoder().decode([Channel].self, from: data)
                    completion(true)
                } catch let err{
                    debugPrint(err as Any)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func clearChannels() {
        self.channels.removeAll()
    }
    
    func findAllMessages(channelId: String, completion: @escaping CompletionHandler) {
        Alamofire.request("\(URL_FIND_ALL_MESSAGES_FOR_CHANNEL)\(channelId)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: bearerHeader).responseJSON { (response) in
            if response.result.error == nil {
                
                self.clearMessages()
                guard let data = response.data else { return }
                if let json = try? JSON(data: data).array {
                    for item in json! {
                        let messageBody = item["messageBody"].stringValue
                        let channelId = item["channelId"].stringValue
                        let userName = item["userName"].stringValue
                        let msgId = item["msgId"].stringValue
                        let avatarName = item["avatarName"].stringValue
                        let avatarColor = item["avatarColor"].stringValue
                        let timeStamp = item["timeStamp"].stringValue
                    let newMessage = Message(messageBody: messageBody, channelId: channelId, userName: userName, msgId: msgId, avatarName: avatarName, avatarColor: avatarColor, timeStamp: timeStamp)
                        
                        self.messages.append(newMessage)
                    }
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    
    }
    
    func clearMessages() {
        self.messages.removeAll()
    }
    
}
