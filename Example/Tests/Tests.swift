import XCTest
import TextFieldFormatter

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFormattingNumber() {
        let textfield = TextFieldFormatter()
        textfield.pattern = "(NNN) NNN NN NN"
        textfield.text = "9993334422"
        XCTAssertEqual(textfield.text, "(999) 333 44 22")
        
        XCTAssertEqual(textfield.formattedText, "(999) 333 44 22")
        
        XCTAssertEqual(textfield.unformattedText, "9993334422")
        
        textfield.text = "9993334"
        
        XCTAssertEqual(textfield.text, "(999) 333 4")
        
        XCTAssertEqual(textfield.formattedText, "(999) 333 4")
        
        XCTAssertEqual(textfield.unformattedText, "9993334")
        
        textfield.pattern = "(NNN) NNN"
        
        XCTAssertEqual(textfield.text, "(999) 333")
        
        XCTAssertEqual(textfield.formattedText, "(999) 333")
        
        XCTAssertEqual(textfield.unformattedText, "999333")
    }
    
    func testUnformattingCreditCard() {
        let textfield = TextFieldFormatter()
        textfield.pattern = "NNNN NNNN NNNN NNNN"
        textfield.text = "9999333344442222"
        XCTAssertEqual(textfield.text, "9999 3333 4444 2222")
        
        XCTAssertEqual(textfield.formattedText, "9999 3333 4444 2222")
        
        XCTAssertEqual(textfield.unformattedText, "9999333344442222")
        
        textfield.text = "9999333344"
        
        XCTAssertEqual(textfield.text, "9999 3333 44")
        
        XCTAssertEqual(textfield.formattedText, "9999 3333 44")
        
        XCTAssertEqual(textfield.unformattedText, "9999333344")
    }
    
    func testUnformattingSerialNumber() {
        let textfield = TextFieldFormatter()
        textfield.pattern = "CC NNNN"
        textfield.text = "cv9999"
        XCTAssertEqual(textfield.text, "CV 9999")
        
        XCTAssertEqual(textfield.formattedText, "CV 9999")
        
        XCTAssertEqual(textfield.unformattedText, "CV9999")
        
        textfield.text = "cv99"
        
        XCTAssertEqual(textfield.text, "CV 99")
        
        XCTAssertEqual(textfield.formattedText, "CV 99")
        
        XCTAssertEqual(textfield.unformattedText, "CV99")
        
        textfield.pattern = "cc NNNN"
        textfield.text = "cv99"
        
        XCTAssertEqual(textfield.text, "cv 99")
        
        XCTAssertEqual(textfield.formattedText, "cv 99")
        
        XCTAssertEqual(textfield.unformattedText, "cv99")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
