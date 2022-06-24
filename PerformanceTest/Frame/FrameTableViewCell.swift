//
//  FrameTableViewCell.swift
//  PerformanceTest
//
//  Created by akozlov on 23.06.2022.
//

import UIKit

class FrameTableViewCell: UITableViewCell {

    static let identifier = String(describing: FrameTableViewCell.self)
    
    private let bigLogoImageView = UIImageView()
    private let smallLogoImageView = UIImageView()
    
    private let topLeftLabel = UILabel()
    private let topRightLabel = UILabel()
    private let botLeftLabel = UILabel()
    private let botRightLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupInitialState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layout()
    }
    
    
    func update(with viewModel: CellViewModel) {
        bigLogoImageView.image = UIImage(named: viewModel.bigLogo)
        smallLogoImageView.image = UIImage(named: viewModel.smallLogo)
        topLeftLabel.text = viewModel.topLeftText
        topRightLabel.text = viewModel.topRightText
        botLeftLabel.text = viewModel.botLeftText
        botRightLabel.text = viewModel.botRightText
    }
    
    private func setupInitialState() {
        contentView.backgroundColor = .white
        
        contentView.addSubview(bigLogoImageView)
        contentView.addSubview(smallLogoImageView)
        contentView.addSubview(topLeftLabel)
        contentView.addSubview(topRightLabel)
        contentView.addSubview(botLeftLabel)
        contentView.addSubview(botRightLabel)
        
        topLeftLabel.numberOfLines = 1
        topRightLabel.numberOfLines = 1
        botLeftLabel.numberOfLines = 1
        botRightLabel.numberOfLines = 1
    }
    
    private func layout() {
        bigLogoImageView.frame = CGRect(x: 16, y: 12, width: 36, height: 36)
        
        let topRightSize = topRightLabel.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: bounds.height))
        topRightLabel.frame = CGRect(x: contentView.bounds.maxX - topRightSize.width, y: 8, width: topRightSize.width, height: topRightSize.height)
        
        let botRightSize = botRightLabel.sizeThatFits(CGSize(width: .greatestFiniteMagnitude, height: bounds.height))
        botRightLabel.frame = CGRect(x: contentView.bounds.maxX - botRightSize.width, y: topRightLabel.frame.maxY + 2, width: botRightSize.width, height: botRightSize.height)

        smallLogoImageView.frame = CGRect(x: topRightLabel.frame.minX - 8 - 18, y: 8, width: 18, height: 18)
        
        let topLeftX = bigLogoImageView.frame.maxX + 12
        let topLeftSize = topLeftLabel.sizeThatFits(CGSize(width: smallLogoImageView.frame.minX - topLeftX, height: bounds.height))
        topLeftLabel.frame = CGRect(x: topLeftX, y: 8, width: topLeftSize.width, height: topLeftSize.height)
        
        let botLeftX = bigLogoImageView.frame.maxX + 12
        let botLeftSize = botLeftLabel.sizeThatFits(CGSize(width: botRightLabel.frame.minX - topLeftX, height: bounds.height))
        botLeftLabel.frame = CGRect(x: botLeftX, y: topLeftLabel.frame.maxY + 2, width: botLeftSize.width, height: botLeftSize.height)
    }
    
}
