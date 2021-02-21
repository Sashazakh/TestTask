//
//  PaymentsCell.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import UIKit
import PinLayout

class PaymentsCell: UITableViewCell {
    static let identifier = "paymentsCell"
   
    private var amountLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    private var createdLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    private var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    private var descLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupMainView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupLayout()
    }
    
    private func setupMainView() {
        contentView.addSubview(amountLabel)
        contentView.addSubview(createdLabel)
        contentView.addSubview(currencyLabel)
        contentView.addSubview(descLabel)
    }
    
    private func setupLayout() {
        setupAmountLabelLayout()
        setupCreatedLabelLayout()
        setupCurrencyLabelLayout()
        setupDescLabelLayout()
    }
    
    private func setupAmountLabelLayout() {
        amountLabel.pin
            .top(3%)
            .hCenter()
            .width(85%)
            .height(20%)
    }
    
    private func setupCreatedLabelLayout() {
        createdLabel.pin
            .below(of: amountLabel)
            .marginTop(3%)
            .hCenter()
            .width(85%)
            .height(20%)
    }
    
    private func setupCurrencyLabelLayout() {
        currencyLabel.pin
            .below(of: createdLabel)
            .marginTop(3%)
            .hCenter()
            .width(85%)
            .height(20%)
    }
    
    private func setupDescLabelLayout() {
        descLabel.pin
            .below(of: currencyLabel)
            .marginTop(3%)
            .hCenter()
            .width(85%)
            .height(20%)
    }
    
    func configureCell(with model: PaymentModel) {
        if let amount = model.amount {
            amountLabel.text = String(amount)
        }
        
        if let created = model.created {
            createdLabel.text = String(created)
        }
        
        if let currency = model.currency {
            currencyLabel.text = currency
        }
        
        if let desc = model.desc {
            descLabel.text = desc
        }
    }
}


