//
//  MVPTableViewPresenter.swift
//  MVP
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol MVPTableViewPresenterView: class {
    func reloadData()
}

class MVPTableViewPresenter {

    weak var view: MVPTableViewPresenterView?
    var items = [Animal]()
    
    init(with view: MVPTableViewPresenterView) {
        self.view = view
    }
    
    #if DEBUG
    func fetchData() {
        Webservice<Animal>.fetch { [weak self] animals in
            self?.items = animals
            self?.view?.reloadData()
        }
    }
    #endif
    
    #if RELEASE
    func fetchData() {
        Webservice<Animal>.fetch { [weak self] animals in
            self?.items = animals
            self?.view?.reloadData()
        }
    }
    #endif
    
    func didSelectRowAt(indexPath: IndexPath) {
        
    }
    
}
