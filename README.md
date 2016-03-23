# Learing swift
Try to make something everyday with swift.

## iPhone Project with swift:

 * Removing Storyboard
 * Init with nib for view controller
 * Adding tableview
 * Registering class with `classForCoder()`
 * Adding tableview delegate

## Trying Request

* URL with string
* Playground cannot make request
* Block

## Implementing [PokemonKit](https://github.com/darkcl/PokemonKit) a wrapper class of Pokeapi-v2 written in swift

* Writing closeure, block in swift `public func fetchBerryList(completion: (result: NSArray) -> Void, failure: (error: NSError) -> Void)`
* Define dictionary `[NSLocalizedDescriptionKey: "Berry List Error"]`
* Tools for mapping objects [Link](https://github.com/cemolcay/DeserializableSwiftGenerator)

## Trying PromiseKit

* Write a promise

```swift
public func fetchBerryList() -> Promise<[PKMBaseObject]>{
    return Promise { fulfill, reject in
        let URL = baseURL + "/berry"
        
        Alamofire.request(.GET, URL).responseArray { (response: Response<[PKMBaseObject], NSError>) in
            if (response.result.isSuccess) {
                fulfill(response.result.value!)
            }else{
                reject(response.result.error!)
            }
        }
    };
}
```

* Writing test case with swift
* Testing asnc calls

```swift
let asyncExpectation = expectationWithDescription("Fetch berries")
        
PokemonKit.fetchBerryList()
    .then { response in
        
        asyncExpectation.fulfill()
    }
    .error{ err in
        XCTFail("Should not failed with \(err)")
    }

self.waitForExpectationsWithTimeout(30) { (err) -> Void in
    XCTAssertNil(err, "Something went wrong")
}
```

* Fixing missing closure for AnyPromise

```swift
PokemonKit.fetchBerry("1")
    .then { response  -> Void in // this is the fix (-> Void in)
    
    ...continue...
```

## Loading cocoapods library bundle resources

Add Resource path in podspec
```ruby
  s.resource_bundles = {
    'CSSwift' => ['Pod/Assets/*.js']
  }
```

Load it with NSBundle
```swift
func loadCssJs() {
    cssJs = JSContext()
    let podBundle = NSBundle(forClass: self.classForCoder)
    
    if let bundleURL = podBundle.URLForResource("CSSwift", withExtension: "bundle") {
        
        if let bundle = NSBundle(URL: bundleURL) {
            
            let cssJsPath = bundle.pathForResource("css", ofType: "js")
            do{
                let content = try String(contentsOfFile: cssJsPath!)
                cssJs.evaluateScript(content)
            }
            catch {}
        }else {
            assertionFailure("Could not load the bundle")
        }
        
    }else {
        assertionFailure("Could not create a path to the bundle")
    }
}
```
