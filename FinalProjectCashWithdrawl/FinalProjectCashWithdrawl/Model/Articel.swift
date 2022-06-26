//
//  Articel.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 24/06/22.
//

import Foundation

struct Articel : Codable{
    
    var key = UUID()
    var title : String = ""
    var postedDate: String = ""
    var imageUrl: String = ""
    var user: User = User()
    
    enum CodingKeys : String,CodingKey{
        case title = "title"
        case postedDate = "postedDate"
        case imageUrl = "imageUrl"
        case user = "user"
    }
}

struct User : Codable{
    
    var fullname: String = ""
    var avatarUrl: String = ""
    
    enum CodingKeys : String,CodingKey{
        case fullname = "fullname"
        case avatarUrl = "avatarUrl"
    }
}

extension Articel : Equatable, Hashable{
    static func == (lhs: Articel, rhs: Articel) -> Bool {
        lhs.key == rhs.key
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
}


