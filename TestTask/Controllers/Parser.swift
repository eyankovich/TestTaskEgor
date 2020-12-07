//
//  Parser.swift
//  TestTask
//
//  Created by Егор Янкович on 12/6/20.
//


import UIKit

class FilmItems: Codable {
    
    var image: String
    var name: String
    var name_eng: String
    var premiere: String
    var description: String
}

struct Answer: Codable {
    var list: [FilmItems]
}

class Parcer {
    static func parce(url: String?) -> [FilmItems]? {
        var data: Data?
        do {
            data = try Data(contentsOf: URL(string: url!)!)
            UserDefaults.standard.setValue(data, forKey: "save")
            
        } catch {
            do {
                let dat = UserDefaults.standard.data(forKey: "save")
                data = Data(dat!)
            }
            print("Error for getting Data:\(error.localizedDescription)")
        }
        guard let data1 = data else {
            print("Error..")
            return nil
        }
        
        do {
            let answer = try JSONDecoder().decode(Answer.self, from: data1)
            return answer.list
        } catch {
            print("Error for getting Data1:\(error.localizedDescription)")
            return nil
        }
    }
}
