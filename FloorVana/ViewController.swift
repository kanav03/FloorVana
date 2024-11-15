//
//  ViewController.swift
//  AppStore
//
//  Created by Navdeep

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource{
    
    
    
    
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.tintColor = UIColor(red: 199/255, green: 175/255, blue: 96/255, alpha: 1.0)
        
        collectionView.dataSource = self
        
        collectionView.setCollectionViewLayout(generateLayout(), animated: true)
        // Do any additional setup after loading the view.
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DataModel.sections.count
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0{
            return DataModel.apps.count
        }else if section == 1{
            return 1
        }else if section == 2{
            return DataModel.standardApps.count
        }
        return 0
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Promoted", for: indexPath)
            
            //for providing dataa to the cell label and image view
            
            let app = DataModel.apps[indexPath.row]
            if let cell = cell as? crousel3dCollectionViewCell{
                cell.titleLabel.text = app.title
                cell.subTitleLabel.text = app.subtitle
                cell.imageView.layer.cornerRadius = 15
                cell.imageView.layer.shadowColor = UIColor.black.cgColor
                cell.imageView.layer.shadowOpacity = 0.1
                cell.imageView.layer.masksToBounds = true
                
                cell.imageView.image = UIImage(named: app.image)
                
                cell.imageView.layer.borderColor = UIColor.systemGray.cgColor
                
            }
            
            
            return cell
        } else if indexPath.section == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "button", for: indexPath)
            let app = DataModel.label2D[indexPath.row]
            
            if let cell = cell as? buttonCollectionViewCell{
                
                cell.planButton.layer.cornerRadius = 15
                cell.label2d.text = app.title
                
                return cell
            }
            
            
        } else if indexPath.section == 2{
        
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "standard", for: indexPath)
        if let cell = cell as? trending2dCollectionViewCell{
        
                       let app = DataModel.standardApps[indexPath.row]

                       cell.titleLabel.text = app.title
                       cell.imageView.image = UIImage(named: app.image)
                       cell.imageView.layer.cornerRadius = 15
                        cell.imageView.layer.borderWidth = 1
            cell.imageView.layer.borderColor = UIColor.systemGray.cgColor
        
                       return cell
                    }
        
        
                }
        
        
        
        
        
                //in case section is not zero,return empty cell
            return UICollectionViewCell()
            }
        
        
        
    
    
    
    
    
    func generateLayout() -> UICollectionViewLayout{
        
        let layout = UICollectionViewCompositionalLayout{ (Section,
                     env)->NSCollectionLayoutSection? in
            
            
            let sectionType = DataModel.sections[Section]
            
            switch sectionType{
                
            case .crousel3d:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),heightDimension: .absolute(360))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
                
                group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20)
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.orthogonalScrollingBehavior = .groupPagingCentered
                return section
                
                
            case .button:
                
//                let buttonWidth: CGFloat = 325
//                let buttonHeight: CGFloat = 50
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:1)
                
                let section = NSCollectionLayoutSection(group: group)
                
            
//                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: (env.container.effectiveContentSize.width - buttonWidth)/2, bottom: 10, trailing: (env.container.effectiveContentSize.width - buttonWidth)/2)
                
                return section
                
                
                
                
            case .trending2D:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .fractionalHeight(0.33))
                
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                       heightDimension: .absolute(180))
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count:1)
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        
                let section = NSCollectionLayoutSection(group: group)
            
                return section
                
            }
        }
        return layout
    }
//    
//    @IBAction func planButtonTapped(_ sender: UIButton) {
//        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        if let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
//            tabBarController.modalPresentationStyle = .fullScreen
//            tabBarController.selectedIndex = 1
//            self.present(tabBarController, animated: true, completion: nil)
//        }
//    }
}
