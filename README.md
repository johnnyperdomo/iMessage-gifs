# iMessage-gifs
iOS iMessage application to share gifs written in Swift 4

## Preview
![Alt Text](https://media.giphy.com/media/RLkz9wb9p98lwWjdtH/giphy.gif )

**Built with**
- Ios 11.4
- Xcode 9.4 

## Features
- **Get Trending Gifs with [Giphy](https://giphy.com/)**
- **Parse JSON Objects from ```API``` easily using [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON), and using [Alamofire](https://github.com/Alamofire/Alamofire) to handle ```HTTP Networking```**
- **Download Gifs using [SwiftGif](https://github.com/swiftgif/SwiftGif)**
- **Search for Gifs using ```UISearchBar```**
- **Send Gif through iMessage using ```MSMessage()```**
  ```swift
  let layout = MSMessageTemplateLayout()
  ...
  let message = MSMessage()
  message.layout = layout
  ```
- **Configure ```MSMessagesAppPresentationStyle```**
  ```swift
  if self.presentationStyle == MSMessagesAppPresentationStyle.expanded {
     self.requestPresentationStyle(MSMessagesAppPresentationStyle.compact)
  }
  ```

## Requirements
```swift
import Messages
import Alamofire
import SwiftyJSON
import SwiftGifOrigin
```

**_Pod Files_**
```swift
  pod 'SwiftyJSON', '~> 4.0'
  pod 'Alamofire', '~> 4.6'
  pod 'SwiftGifOrigin'
```
[SwiftGif](https://github.com/swiftgif/SwiftGif)   
[SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)  
[Alamofire](https://github.com/Alamofire/Alamofire)   

## License
Standard MIT [License](https://github.com/johnnyperdomo/iMessage-gifs/blob/master/LICENSE)
