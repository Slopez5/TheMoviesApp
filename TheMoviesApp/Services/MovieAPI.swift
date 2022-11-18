//
//  MovieAPI.swift
//  TheMoviesApp
//
//  Created by Sergio Omar Lopez Ceballos on 14/11/22.
//

import Foundation
import Alamofire


struct MovieAPI{
    func popularMovies(_ completion:@escaping(_ movies:Movies?) -> ()){
        let url = (Settings.shared.apiURL ?? "") + APIRoutes.populatMovies
        API().call(url:url, params: PopularMoviesRequest().getParams() as! [String : Any]) { data, status in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                if let data = data, let popularMovies = try? decoder.decode(Movies.self, from: data) {
                    completion(popularMovies)
                    return
                }
                completion(nil)
                return
            }
        }
    }
    
    func topRateMovies(_ completion:@escaping(_ movies:Movies?) -> ()){
        let url = (Settings.shared.apiURL ?? "") + APIRoutes.topRatedMovies
        API().call(url:url, params: PopularMoviesRequest().getParams() as! [String : Any]) { data, status in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                if let data = data, let topRatesMovies = try? decoder.decode(Movies.self, from: data) {
                    completion(topRatesMovies)
                    return
                }
                completion(nil)
                return
            }
        }
    }
    
    func movieDetails(movieId:String, _ completion:@escaping(_ movies:MovieDetail?) -> ()){
        let url = (Settings.shared.apiURL ?? "") + APIRoutes.movieDetails + movieId
        API().call(url:url, params: PopularMoviesRequest().getParams() as! [String : Any]) { data, status in
            DispatchQueue.main.async {
                let decoder = JSONDecoder()
                if let data = data, let movieDetails = try? decoder.decode(MovieDetail.self, from: data) {
                    completion(movieDetails)
                    return
                } else {
                    let str = String(decoding: data!, as: UTF8.self)
                    print(str)
                }
                completion(nil)
                return
            }
        }
    }
}
