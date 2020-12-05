/*
 {
   "list": [
     {
       "image": "http://media.kino-govno.com/movies/i/inception/posters/inception_24s.jpg",
       "name": "Начало",
       "name_eng": "Inception",
       "premiere": "22 июля 2010",
       "description": "Кобб, специалист в области архитектуры снов, занимается специфическим видом безопасности — охраной подсознания. Создав мир сна и поместив в него нужных людей, Кобб может проникнуть в этот сон и извлечь секретную информацию. Однажды его действия привели к трагическим последствиям — и Кобб вынужден был навсегда уехать из страны. Бежать от реальности, скрываться от правосудия — таков его незавидный удел."
     },
 {
       "image": "http://media.kino-govno.com/movies/d/district9/posters/district9_18s.jpg",
       "name": "Район № 9",
       "name_eng": "District 9",
       "premiere": "14 августа 2009 года",
       "description": "14 апреля 1982 года человечество вступает в первый контакт с внеземным разумом, когда над Йоханнесбургом зависает гигантский космический корабль. Тем не менее, в течение трех месяцев из него никто не появляется, и земные учёные сами проникают внутрь, прорезав обшивку корабля — внутри они обнаруживают огромное количество сильно истощённых и больных инопланетян."
     }
   ]
 }
 */

import UIKit

//struct List: Codable  {
//    var
//    var list: [FilmItems]
//}

struct FilmItems: Codable {
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
            data = try Data(contentsOf: URL(string: "http://www.mocky.io/v2/57cffac8260000181e650041")!)
        } catch {
            print("Error for getting Data:\(error.localizedDescription)")
            return nil
        }
        guard let data1 = data else {
            print("Error..")
            return nil
        }
        
        do {
    let answer = try JSONDecoder().decode(Answer.self, from: data1)
            return answer.list
        } catch {
            print("Error for getting Data:\(error.localizedDescription)")
            return nil
        }
    }
}
