//
//  HeroModel.swift
//  MarvelApp
//
//  Created by Valery Shestakov on 19.07.2022.
//

import Foundation
import Alamofire
import SwiftyJSON
import UIKit
import CryptoKit

extension Date {
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
}

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
}

private func loadData() -> [[String]]{
    let URL = "https://gateway.marvel.com:443/v1/public/characters"
    let privateKey = "c4297647a4d0311748b4044750e47042d46b9c36"
    let publicKey = "f1b4e81f7a8676c1ad02514d1caa49d4"
    let timestamp = String(Date().ticks)
    let hash = timestamp + privateKey + publicKey
    let paramForListOfHeroes = URL + "?ts=" + timestamp + "&apikey=" + publicKey + "&hash=" + hash.MD5
    var arrayBuff = [[String]]()
    
    AF.download(paramForListOfHeroes).responseJSON { response in
        switch response.result {
        case .success(let value):
            let json = JSON(value)
            let arrayName =  json["data"]["results"].arrayValue.map {$0["name"].string!}
            let arrayDiscription =  json["data"]["results"].arrayValue.map {$0["description"].string!}
            let arrayImages =  json["data"]["results"].arrayValue.map {$0["thumbnail"]["path"].string!}
            arrayBuff = [arrayName,arrayDiscription,arrayImages]
            print(arrayBuff)
        case .failure(let error):
            print(error)
        }
    }
        return arrayBuff
}

struct HeroModel {
    var image: UIImage
    var name: String
    var details: String
    
    static func fetchHero() -> [HeroModel] {
        let infoHeroes = loadData()
//        var listHeros = [HeroModel]()
//        for idx in 0...infoHeroes[0].count-1 {
//            let imageURL = infoHeroes[2][idx] + ".jpg"
//            AF.download(imageURL).responseData { response in
//                if let data = response.value {
//                    listHeros.append(HeroModel(image: UIImage(data: data)!, name: infoHeroes[0][idx], details: infoHeroes[1][idx]))
//                }
//            }
//        }
//
        let firstItem = HeroModel(image: UIImage(named: "ironman")!, name: "Iron Man", details: "I AM IRON MAN")
        let secondItem = HeroModel(image: UIImage(named: "thor")!, name: "Thor", details: "I AM THOR, GOD OF THE TUNDER")
        let threeItem = HeroModel(image: UIImage(named: "halk")!, name: "Halk", details: "BREAK BREAK BREAK!")
        
        return [firstItem]
    }
}

struct Constrants {
    static let leftDistanceToView: CGFloat = 0
    static let rightDistanceToView: CGFloat = 0
    static let galleryMinimumLineSpacing: CGFloat = 25
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constrants.leftDistanceToView - Constrants.rightDistanceToView - (Constrants.galleryMinimumLineSpacing / 2))
    static let galleryItemHeight = UIScreen.main.bounds.height - 150
}
