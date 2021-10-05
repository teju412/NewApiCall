//
//  Router.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 5/10/21.
//

import Foundation
import UIKit
protocol routing {
    var vc: UIViewController { get }
    func routeFromDidSelectedRow()

}
struct RoutingStruct: routing {
    var vc: UIViewController
    
    func routeFromDidSelectedRow() {
        let nextVC = vc.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
         vc.navigationController?.pushViewController(nextVC, animated: true)
    }
}
