import Cocoa

var url_arg = CommandLine.arguments[1]

let pb = NSPasteboard.general

if let url = NSURL(string: url_arg) {
    if let data = NSData(contentsOf: url as URL) {
        //var image =  NSImage(data: data as Data)
        let fileName = url.lastPathComponent
        var saveURL = NSURL(string: "file://" + NSTemporaryDirectory())
        saveURL = saveURL?.appendingPathComponent(fileName!) as NSURL?
        data.write(to: saveURL! as URL, atomically: true)

        
        pb.declareTypes([NSPasteboard.PasteboardType.fileContents], owner: nil)
        pb.writeObjects([saveURL!])

    }
}
