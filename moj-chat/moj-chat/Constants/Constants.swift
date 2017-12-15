import Foundation
                                        // CONSTANTS

// Segues

let TO_LOGIN_PAGE = "to_login_page"
let TO_CREATE_ACCOUNT = "to_create_account"
let UNWIND = "unwind"
let TO_AVATAR_PICKER = "to_avatar_picker"

// Cell
let tableCell = "tableCell"


// USER DEFAULTS

let ULOGOVAN = "ulogovan"
let AUTHTOKEN = "AuthToken"
let USEREMAIL = "userEmail"

// URL

let BASE_URL = "https://moj-chat-app.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADD_USER = "\(BASE_URL)user/add"

let URL_FIND_USER = "\(BASE_URL)user/byEmail/\(RegistracioniServer.instance.userEmail)"

let URL_FIND_CHANNELS = "\(BASE_URL)channel/"                                   // <----- ja mislim da bi trebalo bez / na kraju!
let URL_FIND_ALL_MESSAGES_FOR_CHANNEL = "\(BASE_URL)message/byChannel/"         // <-----   / !!!!!


// Headers

let headerForRegAndLog = [
    "Content-Type":"application/json; charset=utf-8"
]


let bearerHeader = [
"Content-Type":"application/json; charset=utf-8",
    "Authorization":"Bearer \(RegistracioniServer.instance.AuthToken)"
]

// Completion Handler

typealias CompletionHandler = (_ Success: Bool) -> ()

// Collection View Cell

let avatarCellIdentifier = "avatarCell"

