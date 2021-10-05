//
//  ViewController.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 3/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = NYTListViewModel()
    var routes: RoutingStruct?
    override func viewDidLoad() {
        routes = RoutingStruct.init(vc: self)
        super.viewDidLoad()
        print("Doing this change in public search")
        dataReload()
    }
    func dataReload() {
        addObsevers()
        viewModel.fetchNytData()
    }
    fileprivate func addObsevers() {
        viewModel.newsDocs.addObserver { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

}
/**
 Master -> Branch A -> NYTCODE
 Viewcontroller push  -> either vengal or you -> Branch-A
 
 Branch_A -> NytModules(Branch) -> Push -> BanchA MR -> merger
 Branch_A -> PUblicSearch(Brach) -> Push ->  PUblicSearch MR BranchA -> Vengal changes
 
 SigunupFLow -> 2days
 
 MasterBranch -> push
 
 LoginModuleFeatureBrnahc     ;-Design Screen -1  , APICalling- 2 , ErrorCheking- 1
 
 SUbtask1 branch - Desingcode -> LoginModuleFeatureBrnahc MR
 Subtask2 - APi MR
 SUbtask3 ;- Errorchecking -MR
 */
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.newData?.count ?? 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: PublicTableViewCell.identifier, for: indexPath) as! PublicTableViewCell
//        cell.configure(with:"gg", desc: "gg", api: "gg")
//
//        return cell
//    }
//
//
//
//}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.newsCount
        return viewModel.newsDocs.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.newsDocs.value?[indexPath.row].fullName
        cell.detailTextLabel?.text = viewModel.newsDocs.value?[indexPath.row].abstract
//        cell.apiLbl.text = viewModel.newData?[indexPath.row].API
//        cell.descLbl.text = viewModel.newData?[indexPath.row].Description
//        cell.catogeryLbl.text = viewModel.newData?[indexPath.row].Category
        print("Cherry pick")

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routes?.routeFromDidSelectedRow()
        print("You selected cell #\(indexPath.row)!")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
         }
         return UITableView.automaticDimension
    }


}
