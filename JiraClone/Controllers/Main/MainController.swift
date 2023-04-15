//
//  MainController.swift
//  JiraClone
//
//  Created by user1 on 14/04/23.
//

import UIKit

class MainController: UIViewController {
    
    //MARK: Properties
    var plans = [
        Plan(name: "plan1", status: [
            Status(title: "Todo", items: ["Todo1", "Todo1", "Todo1", "Todo1"]),
            Status(title: "Progress", items: ["Progress1", "Progress1", "Progress1"]),
            Status(title: "QA", items: ["QA1", "QA1"]),
            Status(title: "Done", items: ["Done1", "Done1"])
        ]),

        Plan(name: "plan2", status: [
            Status(title: "Todo", items: ["Todo2", "Todo2", "Todo2", "Todo2"]),
            Status(title: "Progress", items: ["Progress2", "Progress2", "Progress2"]),
            Status(title: "QA", items: ["QA2", "QA2"]),
            Status(title: "Done", items: ["Done2", "Done2"])
        ])
    ]

    var choosedPlanIndex: Int = 0 {
        didSet {
            updateChosedPlan()
        }
    }
    
//    var plans: [Plan] = []
    let mainView = MainView()
    
    //MARK: Lifeciycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callBaseView()
//        getData()
    }
    
    // MARK: - Private functions
    private func callBaseView() {
        mainView.frame = view.bounds
        view.addSubview(mainView)
        view.backgroundColor = .white
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    private func updateChosedPlan() {
        mainView.collectionView.reloadData()
    }
    
//    func getData() {
//        Fire.shared.getPlans { plans in
//            for i in plans {
//                print("😎", i, "😎")
//            }
//            self.plans = plans
//            self.mainView.collectionView.reloadData()
//        }
//
//    }
    
}

//MARK: - tableview delegate & datasource
extension MainController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(plans[indexPath.row].name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        choosedPlanIndex = indexPath.row
    }
    
}

//MARK: - collectionview delegate & datasource
extension MainController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return plans[choosedPlanIndex].status.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BoardCell.reuseIdentifier, for: indexPath) as? BoardCell {
            
            cell.setup(with: plans[choosedPlanIndex].status[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension MainController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if UIDevice.isPad {
            print("ipad😆")
            return CGSize(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height * 0.8)
        } else if UIDevice.isPhone {
            print("iphone😆")
            return CGSize(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height * 0.8)
        }
        
        return CGSize(width: 0, height: 0)
    
    }
}
