// Supported Functions & Class
//      Numberic:
//          parseInt(string, radix)
//          parseFloat(string)
//      URL Encoding:
//          encodeURI(uri)
//          decodeURI(encodedURI)
//          encodeURIComponent(uriComponent)
//          decodeURIComponent(encodedURIComponent)
//      Object Constructs:
//          Object
//          Function
//          String:
//              startsWith(searchString [, position ]) / endsWith(searchString [, endPosition ]) 
//              indexOf(searchString ,position) / lastIndexOf(searchString, position)
//              trim()
//          Array:
//              pop() / push([item1 [, item2 [, ...]]])
//              reverse()
//              shift() / unshift([item1 [, item2 [, ...]]])
//              slice(start, end)
//              sort(comparefn)
//              indexOf(searchElement [, fromIndex]) / lastIndexOf(searchElement [, fromIndex])
//              every(callbackfn [, thisArg]) / forEach(callbackfn [, thisArg])
//              some(callbackfn [, thisArg])
//              map(callbackfn [, thisArg])
//              filter(callbackfn [, thisArg])
//              reduce(callbackfn [, initialValue]) / reduceRight(callbackfn [, initialValue])
//          ArrayBuffer
//          Date
//          RegExp
//              exec(string)
//              test(string)
//          Map
//          Set
//          XMLHttpRequest
//      JSON:
//          parse(text [, reviver])
//          stringify(value [, replacer [, space]])
//      Qt

// XMLHttpRequest
function request() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
            console.log('HEADERS_RECEIVED');
        } else if(xhr.readyState === XMLHttpRequest.DONE) {
            console.log('DONE');
            if (xhr.status === 200) {
                console.log(xhr.responseText);
            }
        }
    }
    xhr.open("GET", "http://example.com");
    xhr.send();
}

// JSON.parse()
var object = JSON.parse(xhr.responseText.toString());
console.log(JSON.stringify(object, null, 2));

// LocalStorage
import QtQuick.LocalStorage
var db = LocalStorage.openDatabaseSync("QDeclarativeExampleDB", "1.0", "The Example QML SQL!", 1000000);
db.transaction((tx) => {
    // rs = tx.executeSql(sql)
    //      rows.length	
    //      rows.item(i)
    //      rowsAffected
    //      insertId
    // Create the database if it doesn't already exist
    tx.executeSql('CREATE TABLE IF NOT EXISTS greeting(salutation TEXT, salutee TEXT)');
    // Add (another) greeting row
    tx.executeSql('INSERT INTO Greeting VALUES(?, ?)', [ 'hello', 'world' ]);
    // Show all added greetings
    var rs = tx.executeSql('SELECT * FROM greeting');
    var r = ""
    for (var i = 0; i < rs.rows.length; i++) {
        r += rs.rows.item(i).salutation + ", " + rs.rows.item(i).salutee + "\n"
    }
    text = r
});
