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
    
    func topRateMovies(){
        
    }
}
