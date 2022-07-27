//
//  ViewController.swift
//  MarvelApp
//
//  Created by Valery Shestakov on 19.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFit
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let label: UILabel = {
        let textMarvel = UILabel()
        textMarvel.text = "Choose your hero"
        textMarvel.textColor = .white
        textMarvel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        textMarvel.translatesAutoresizingMaskIntoConstraints = false
        return textMarvel
    }()
    
    private var galleryCollectionView = GalleryCollectionView()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedItem = sender as? HeroModel else {
            return
        }
        
        if segue.identifier == "DetailCollectionView" {
            guard let destinationVC = segue.destination as?
                    DetailViewController else {
                return
            }
            destinationVC.imageHero.image = selectedItem.image
            destinationVC.nameHero.text = selectedItem.name
            destinationVC.detailHero.text = selectedItem.details
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.16, green: 0.15, blue: 0.17, alpha: 0.9)
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        let figure = TriangleView(width: view.frame.width, height: view.frame.height)
        view.addSubview(figure)
        view.addSubview(galleryCollectionView)
        view.addSubview(logo)
        view.addSubview(label)

        logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        logo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 90).isActive = true
        logo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -90).isActive = true
        logo.heightAnchor.constraint(equalToConstant: view.frame.height / 13).isActive = true
        
        label.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 75).isActive = true
        label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60).isActive = true
        
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10).isActive = true
        galleryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        galleryCollectionView.set(cells: HeroModel.fetchHero())
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryCollectionView.cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        galleryCollectionView.collectionView(collectionView, cellForItemAt: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constrants.galleryItemWidth, height: Constrants.galleryItemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = galleryCollectionView.cells[indexPath.row]
        self.performSegue(withIdentifier: "DetailCollectionView", sender: selectedData)
    }
}


