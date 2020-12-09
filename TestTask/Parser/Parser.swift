//
//  Parser.swift
//  TestTask
//
//  Created by Егор Янкович on 12/6/20.
//

import UIKit

// MARK: - JSON Body Class
class FilmItems: Codable {
    var image: String
    var name: String
    var name_eng: String
    var premiere: String
    var description: String
}

// MARK: - Answer Structure
struct Answer: Codable {
    var list: [FilmItems]
}

// MARK: - JSON Parcer
class Parcer {
    static func parce(url: String) -> [FilmItems]? {
        var data: Data?
        do {
            if let URL = URL(string: url) {
                data = try Data(contentsOf: URL)
                UserDefaults.standard.setValue(data, forKey: "save")
            }
        } catch {
            do {
                if let dat = UserDefaults.standard.data(forKey: "save") {
                    data = Data(dat)
                }
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
