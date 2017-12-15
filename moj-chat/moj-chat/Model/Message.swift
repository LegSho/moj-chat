import Foundation
struct Message: Decodable {
    public private(set) var messageBody: String!
    public private(set) var channelId: String!
    public private(set) var userName: String!
    public private(set) var msgId: String!
    public private(set) var avatarName: String!
    public private(set) var avatarColor: String!
    public private(set) var timeStamp: String!
}
