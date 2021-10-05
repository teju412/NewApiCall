//
//  NTYListViewModel.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 3/10/21.
//

import Foundation

class NYTListViewModel {
    var newsDocs: Observer<[NYTNewFeed]> = Observer(value: [NYTNewFeed]())
    var newData: [PublicEntries]?
    var newsCount: Int {
        return newsDocs.value?.count ?? 0
    }
    func fetchNytData(){
        DataManager.getServerData(str: ApiUrls.nytSearchURl, type: NytSearchModel.self) { obj, error in
            let dataResponse = obj?.response?.docs
            self.newsDocs.value = dataResponse
        }
    }
    func fetchPublicApiData(completionHandler:@escaping(_ reloadData: Bool) -> Void) {
        DataManager.getServerData(str: ApiUrls.publicApiUrl, type: PublicSearchModel.self) { obj, error in
            if error == nil{
                let dataResponse = obj?.entries
                self.newData = dataResponse
                completionHandler(true)
            } else {
                completionHandler(false)
            }
        }
    }
    
    
}
