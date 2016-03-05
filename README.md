# Learing swift
Try to make something everyday with swift.

## Day One
iPhone Project with swift:

 * Removing Storyboard
 * Init with nib for view controller
 * Adding tableview
 * Registering class with `classForCoder()`
 * Adding tableview delegate

## Day Two
Trying Request

* URL with string
* Playground cannot make request
* Block

## Day Three
Implementing [PokemonKit](https://github.com/darkcl/PokemonKit) a wrapper class of Pokeapi-v2 written in swift

* Writing closeure, block in swift `public func fetchBerryList(completion: (result: NSArray) -> Void, failure: (error: NSError) -> Void)`
* Define dictionary `[NSLocalizedDescriptionKey: "Berry List Error"]`
* Tools for mapping objects [Link](https://github.com/cemolcay/DeserializableSwiftGenerator)
* 
## Day Four
Trying PromiseKit

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
## Day 5

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
