//
//  URLShortenHistoryCell.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/13/21.
//

import UIKit

class URLShortenHistoryCell: UITableViewCell {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var rootURLLabel: UILabel!
    @IBOutlet private weak var shortURLLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        rootURLLabel.isUserInteractionEnabled = true
        shortURLLabel.isUserInteractionEnabled = true
        rootURLLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapRootURL)))
        shortURLLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapShortURL)))
    }
    
    func setData(urlModel: URLModel) {
        dateLabel.text = urlModel.time.toString()
        rootURLLabel.attributedText = NSMutableAttributedString(string: urlModel.rootUrl).setAsLink(linkName: urlModel.rootUrl)
        shortURLLabel.attributedText = NSMutableAttributedString(string: urlModel.shortUrl).setAsLink(linkName: urlModel.shortUrl)
    }
    
    @objc private func tapRootURL() {
        guard let text = rootURLLabel.text else {
            return
        }
        if let url = URL(string: text) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc private func tapShortURL() {
        guard let text = shortURLLabel.text else {
            return
        }
        if let url = URL(string: text) {
            UIApplication.shared.open(url)
        }
    }

}
