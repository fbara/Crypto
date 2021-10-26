//
//  MarketDataModel.swift
//  Crypto
//
//  Created by Frank Bara on 10/25/21.
//

import Foundation
import SwiftUI

// JSON Data
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON Response:
 
 {
 "data": {
 "active_cryptocurrencies": 10029,
 "upcoming_icos": 0,
 "ongoing_icos": 50,
 "ended_icos": 3375,
 "markets": 667,
 "total_market_cap": {
 "btc": 43388425.094382174,
 "eth": 651014929.8300881,
 "ltc": 14017269370.883684,
 "bch": 4380991809.218343,
 "bnb": 5639132183.7432785,
 "eos": 568849383484.1744,
 "xrp": 2495282877381.8555,
 "xlm": 7136848074464.446,
 "link": 85000859495.26796,
 "dot": 61649969173.32551,
 "yfi": 78568244.01251985,
 "usd": 2745749601980.3027,
 "aed": 10085687437994.037,
 "ars": 273160899153010.6,
 "aud": 3663955726378.5347,
 "bdt": 235153645571984.12,
 "bhd": 1035180548941.7983,
 "bmd": 2745749601980.3027,
 "brl": 15230123892264.33,
 "cad": 3400803084524.7427,
 "chf": 2524590454539.197,
 "clp": 2223535485179669,
 "cny": 17533807808325.832,
 "czk": 60804073040183.78,
 "dkk": 17589186832048.156,
 "eur": 2364535218740.5596,
 "gbp": 1994045733446.1536,
 "hkd": 21345045543354.59,
 "huf": 864853521542894.8,
 "idr": 38902741373217630,
 "ils": 8789007188458.838,
 "inr": 206002444893198.12,
 "jpy": 312146424876727.56,
 "krw": 3206870790136876.5,
 "kwd": 827711709016.1676,
 "lkr": 554627333904563.44,
 "mmk": 5079512488290807,
 "mxn": 55393304366020.56,
 "myr": 11398979472621.234,
 "ngn": 1126333944228338.8,
 "nok": 22930578651018.09,
 "nzd": 3830567812226.701,
 "php": 139132615594296.86,
 "pkr": 478790086845314.8,
 "pln": 10911197055829.416,
 "rub": 191693410162413.94,
 "sar": 10298439100153.893,
 "sek": 23642881012763.85,
 "sgd": 3697975563947.073,
 "thb": 90774470858470.45,
 "try": 26332013257951.316,
 "twd": 76525963431912.61,
 "uah": 72489936668468.6,
 "vef": 274931907646.28766,
 "vnd": 62538525932982740,
 "zar": 40375838780429.664,
 "xdr": 1940209821000.129,
 "xag": 111745364086.56131,
 "xau": 1518811392.3354027,
 "bits": 43388425094382.17,
 "sats": 4338842509438217.5
 },
 "total_volume": {
 "btc": 1984734.1816792923,
 "eth": 29779637.79986609,
 "ltc": 641197591.1474411,
 "bch": 200401470.54193196,
 "bnb": 257953091.76898915,
 "eos": 26021106163.044735,
 "xrp": 114142728364.20746,
 "xlm": 326463712200.41455,
 "link": 3888228506.690384,
 "dot": 2820079338.017192,
 "yfi": 3593978.789203803,
 "usd": 125599928495.40457,
 "aed": 461353657349.3196,
 "ars": 12495308886365.332,
 "aud": 167601800583.55276,
 "bdt": 10756727797747.23,
 "bhd": 47352680241.90949,
 "bmd": 125599928495.40457,
 "brl": 696677683378.3094,
 "cad": 155564303436.5532,
 "chf": 115483356654.8137,
 "clp": 101712078094863.6,
 "cny": 802056023385.9553,
 "czk": 2781385170945.106,
 "dkk": 804589248343.7783,
 "eur": 108161885622.9595,
 "gbp": 91214436071.21759,
 "hkd": 976395004134.0016,
 "huf": 39561342515152.51,
 "idr": 1779543746897866,
 "ils": 402039091117.36475,
 "inr": 9423252699300.516,
 "jpy": 14278639471107.318,
 "krw": 146693180486922.9,
 "kwd": 37862349644.79676,
 "lkr": 25370541228438.562,
 "mmk": 232354182938134.03,
 "mxn": 2533878203051.9165,
 "myr": 521428103148.6724,
 "ngn": 51522346668099.86,
 "nok": 1048922682843.6718,
 "nzd": 175223204244.654,
 "php": 6364399199919.345,
 "pkr": 21901487531386.152,
 "pln": 499115275851.463,
 "rub": 8768708767935.269,
 "sar": 471085642208.85815,
 "sek": 1081505816293.951,
 "sgd": 169157983697.61096,
 "thb": 4152333133658.364,
 "try": 1204515874263.78,
 "twd": 3500557927116.881,
 "uah": 3315936331422.7573,
 "vef": 12576320840.244858,
 "vnd": 2860724947287813.5,
 "zar": 1846928234135.5789,
 "xdr": 88751798273.20833,
 "xag": 5111613137.935998,
 "xau": 69475600.44723296,
 "bits": 1984734181679.2922,
 "sats": 198473418167929.25
 },
 "market_cap_percentage": {
 "btc": 43.45441660762467,
 "eth": 18.137074262334053,
 "bnb": 2.9810060606252597,
 "usdt": 2.576004542507691,
 "ada": 2.5294801040973733,
 "sol": 2.3310594694087263,
 "xrp": 1.881079876436836,
 "dot": 1.6921264243088072,
 "doge": 1.2650845745600057,
 "usdc": 1.1928447059360334
 },
 "market_cap_change_percentage_24h_usd": 4.829101890028178,
 "updated_at": 1635187977
 }
 }
 
 */

struct GlobalData: Codable {
    let data: MarketDataModel
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var bitDominence: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
    
}
