import UIKit
import PDFKit
import PlaygroundSupport

if #available(iOSApplicationExtension 11.0, *){
    
    var pdfdocument: PDFDocument?
    var pdfview: PDFView!
    
    pdfview = PDFView(frame: CGRect(x: 0, y: 0, width: 200, height: 400))
    
    let url = Bundle.main.url(forResource: "sample", withExtension: "pdf")
    pdfdocument = PDFDocument(url: url!)
    
    pdfview.document = pdfdocument
    pdfview.displayMode = PDFDisplayMode.singlePageContinuous
    pdfview.autoScales = true
    
    PlaygroundPage.current.liveView = pdfview
}
else {
    print("PDFKit is not supported for versions before iOS 11.0")
}

