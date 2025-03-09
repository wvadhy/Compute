//
//  DeepDiveViewController.swift
//  Compute
//
//  Created by William Halliday on 27/02/2025.
//

import UIKit
import Highlightr

class DeepDiveViewController: UIViewController {
    
    @IBOutlet weak var codeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        codeView.customView(setup: true)
        view.setGradientBackground(colorTop: .white, colorBottom: .mainColour)
        
//        let highlightr = Highlightr()
//        highlightr?.setTheme(to: "paraiso-dark")
//        let code = "let a = 1"
//        let highlightedCode = highlightr!.highlight(code, as: "swift")
//        
//        syntaxView.attributedText = highlightedCode
        
        let textStorage = CodeAttributedString()
        textStorage.language = "Python"
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)

        let textContainer = NSTextContainer(size: view.bounds.size)
        layoutManager.addTextContainer(textContainer)

        let textView = UITextView(frame: CGRect(x: 8, y: 8, width: 304, height: 304), textContainer: textContainer)
        
        textView.autocorrectionType = .no
        textView.autocapitalizationType = .none
        textView.spellCheckingType = .no
        
        codeView.addSubview(textView)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        codeView.customView()
    }

}
