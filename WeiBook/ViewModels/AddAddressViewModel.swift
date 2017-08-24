//
//  AddAddressViewModel.swift
//  WeiBook
//
//  Created by Zhang on 24/08/2017.
//  Copyright © 2017 Zhang. All rights reserved.
//

import UIKit

class AddAddressViewModel: BaseViewModel {

    var address = ""
    override init() {
        super.init()
    }

}

extension AddAddressViewModel : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
}

extension AddAddressViewModel : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: DetailAddressTableViewCell.description(), for: indexPath) as! DetailAddressTableViewCell
        cell.textView.reactive.continuousTextValues.observeValues({ (str) in
            self.address = str!
        })
        cell.selectionStyle = .none
        return cell
    }
}



