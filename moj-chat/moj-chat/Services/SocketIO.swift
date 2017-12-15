import Foundation
import SocketIO

class SocketServer: NSObject {
    static let instance = SocketServer()
    override init() {
        super.init()
    }
    
    public let manager: SocketManager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    
    func establishConnection() {
        manager.defaultSocket.connect()
    }
    func disconnectConnection() {
        manager.defaultSocket.disconnect()
    }
    
    func addChannel(name: String, description: String, completion: @escaping CompletionHandler) {
        manager.defaultSocket.emit("newChannel", name, description)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        manager.defaultSocket.on("channelCreated") { (dataArray, ack) in
            guard let name = dataArray[0] as? String else { return }
            guard let description = dataArray[1] as? String else { return }
            guard let id = dataArray[2] as? String else { return }
            
            let newChannel = Channel(id: id, description: description, name: name, __v: nil)
            MessageServer.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
    func addMessage(messageBody: String, channelId: String, completion: @escaping CompletionHandler) {
        let user = UserServer()
        manager.defaultSocket.emit("newMessage", messageBody, user.id, channelId, user.username, user.avatarName, user.avatarColor)
    }
    
    func getMessage(completion: @escaping CompletionHandler){
        
        manager.defaultSocket.on("messageCreated") { (dataArray, ack) in
            guard let messageBody = dataArray[0] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return}
            guard let userName = dataArray[3] as? String else { return}
            guard let avatarName = dataArray[4] as? String else { return }
            guard let avatarColor = dataArray[5] as? String else { return }
            guard let messageId = dataArray[6] as? String else { return }
            guard let timeStamp = dataArray[7] as? String else { return }
            
            let newMessage = Message(messageBody: messageBody, channelId: channelId, userName: userName, msgId: messageId, avatarName: avatarName, avatarColor: avatarColor, timeStamp: timeStamp)
            MessageServer.instance.messages.append(newMessage)
            completion(true)
        }
        
    }
    
    func typingUsers(_ completion: @escaping (_ typingUsers: [String:String]) -> Void) {
        manager.defaultSocket.on("userTypingUpdate") { (dataArray, ack) in
            guard let typingUser = dataArray[0] as? [String:String] else { return }
            completion(typingUser)
        }
    }
    
}
