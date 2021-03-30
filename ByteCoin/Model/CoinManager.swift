//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinModelDelegate {
    func didUpdateCoin(_ coinManager: CoinManager,_ coin: WeatherModel)
    func didUpdateWithError(error: Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "4F2608D3-2632-4171-AE68-EA864866D091"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    var delegate: CoinModelDelegate?
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    let bitcoinPrice = self.parseJson(safeData)
                    self.delegate?.didUpdateCoin(self, bitcoinPrice!)
                }
            }
            
            task.resume()

        }
        
    }
    
    func parseJson(_ data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do{
            let decodeData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodeData.rate
            let currencyValt = decodeData.asset_id_quote
            let price = WeatherModel(rate: lastPrice, currency: currencyValt)
            return price
        }catch{
            delegate?.didUpdateWithError(error: error)
            return nil
        }
    }
    
   
}
