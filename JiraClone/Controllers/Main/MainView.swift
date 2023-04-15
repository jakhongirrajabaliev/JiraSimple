//
//  MainView.swift
//  JiraClone
//
//  Created by user1 on 14/04/23.
//

import UIKit

class MainView: UIView {
    
    // MARK: - UI Elements
    var plansView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 50, left: 8, bottom: 8, right: 8)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(BoardCell.self, forCellWithReuseIdentifier: BoardCell.reuseIdentifier)
        collectionView.backgroundColor = .systemGray4
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
        
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        addConstraints()
    }
    
    // MARK: - Private functions
    private func addViews() {
        addSubview(plansView)
        addSubview(collectionView)
        plansView.addSubview(tableView)
    }
    
    private func addConstraints() {
        
        plansView.snp.makeConstraints { make in
            make.topMargin.equalTo(safeAreaInsets.top)
            make.bottomMargin.equalTo(safeAreaInsets.bottom)
            make.leftMargin.equalTo(safeAreaLayoutGuide.snp.left)
            make.width.equalTo(150)
        }
        
        collectionView.snp.makeConstraints { make in
            make.topMargin.equalTo(safeAreaInsets.top)
            make.bottomMargin.equalTo(safeAreaInsets.bottom)
            make.right.equalToSuperview()
            make.left.equalTo(plansView.snp.right)
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

