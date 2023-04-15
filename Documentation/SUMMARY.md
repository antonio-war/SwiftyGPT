# Language Translation

This feature allows you to summarise a text, choosing from all languages those supported by SwiftyGPT..
<br />
It can be thought of as a simple wrapper around the 'Completion' feature which performs a pre-set task, using optimized parameters.
<br />
Specifying the language used in the input text is not mandatory, in fact the model is able to understand it independently. However, in some cases specifying it speeds up response times and increases the quality of the output.

```swift
let text = """
            La mia istruttrice di nuoto Elke W. aveva un cane barbone bianco, piuttosto grande per la sua razza, di nome Martino. Lei stessa ammetteva che era un cane stupido e fifone, pieno di difetti che lei amava elencare anche a interlocutori occasionali o a perfetti sconosciuti che incontrava per strada. Martino aveva paura, tra le altre cose, degli oggetti appuntiti, delle oche (un cane barbone che aveva paura della oche!) e di entrare nei furgoni dalla parte posteriore. In compenso appena poteva si buttava nell’acqua a nuotare e non si faceva scoraggiare dalla stagione avversa e dalla veemenza dei flutti, talché un giorno di marzo fu proprio la padrona a dover entrare nell’acqua gelata fino alla vita e trascinarlo fuori dal mare per il collare, dopo che il povero Martino era stato sul punto di soccombere. Lo coperse di contumelie, un po’ in italiano e un po’ in dialetto, mentre lui uggiolava sotto un massaggio vigoroso a colpi di plaid.
        """
        
swiftyGPT.summary(text: text, language: .italian) { result in
    switch result {
    case .success(let response):
        print(response)
    case .failure(let error):
        if let error = error as? SwiftyGPTError {
            print(error.message)
        } else {
            print(error.localizedDescription)
        }
    }
    expectation.fulfill()
}
```

If successful, the method returns the summarized text directly in string format.

## Async/Await

The feature is also available in Async/Await version.

```swift
let result: Result<String, Error> = await swiftyGPT.summary(text: text, language: .italian)
```
