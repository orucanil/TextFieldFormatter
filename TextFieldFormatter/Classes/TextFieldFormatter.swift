
public class TextFieldFormatter: UITextField {
    
    public override var text: String? {
        didSet {
            if oldText != text {
                let lastText = text?.format(pattern, oldString: oldText) ?? ""
                oldText = lastText
                text = lastText
            }
        }
    }
    
    public var formattedText: String {
        return text ?? ""
    }
    
    public var unformattedText: String {
        return (text ?? oldText).unformat(pattern, oldString: oldText)
    }
    
    // MARK: - Inspectable
    @IBInspectable
    public var pattern: String = "" {
        didSet {
            oldText = ""
            formatText()
        }
    }
    
    // MARK: - Private Properties
    private var oldText: String = ""
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        commonInit()
    }
    
    private func commonInit() {
        removeTarget(self, action: #selector(textFieldDidChangeFormatter), for: .editingChanged)
        removeTarget(self, action: #selector(textFieldDidEndEditingFormatter), for: .editingDidEnd)
        removeTarget(self, action: #selector(textFieldDidChangeFormatter), for: .valueChanged)
        
        addTarget(self, action: #selector(textFieldDidChangeFormatter), for: .editingChanged)
        addTarget(self, action: #selector(textFieldDidEndEditingFormatter), for: .editingDidEnd)
        addTarget(self, action: #selector(textFieldDidChangeFormatter), for: .valueChanged)
    }
    
    // MARK: - Observer Methods
    @objc private func textFieldDidChangeFormatter() {
        formatText()
    }
    
    @objc private func textFieldDidEndEditingFormatter() {
        formatText()
    }
    
    private func formatText() {
        self.text = text ?? ""
    }
}
