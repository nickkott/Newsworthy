var newsworthy = {};
newsworthy.urls = {};

newsworthy.urls.db = null;
newsworthy.urls.open = function () {
    var version = 1;
    var request = indexedDB.open("urls", version);

    request.onupgradeneeded = function (e) {
        var db = e.target.result;

        e.target.transaction.onerror = newsworthy.urls.onerror;

        if (db.objectStoreNames.contains("urls")) {
            db.deleteObjectStore("urls");
        }

        var store = db.createObjectStore("urls", { keyPath: "host" });
    };

    request.onsuccess = function (e) {
        newsworthy.urls.db = e.target.result;
        //newsworthy.urls.getAllUrlItems();
    };

    request.onerror = newsworthy.urls.onerror;
};

newsworthy.urls.add = function (host, url) {
    var db = newsworthy.urls.db;
    var trans = db.transaction(["urls"], "readwrite");
    var store = trans.objectStore("urls");

    var keyRange = IDBKeyRange.only(host);
    var cursorRequest = store.openCursor(keyRange);

    var links = null;
    cursorRequest.onsuccess = function (e) {
        var result = e.target.result;
        if (!!result == false)
            return;

        links = result.value;
        _populateLinks(url, links.url);
        links;
    }
    if (links == null) {
        links = {
            "url": url,
            "host": host
        };
    }

    var request = store.put(links);

    request.onsuccess = function (e) {
        //newsworthy.urls.getAllUrlItems();
    };

    request.onerror = function (e) {
        console.log(e.value);
    };
};

function _populateLinks(source, destination) {
    if (!(source instanceof Object))
        return;
    var paths = Object.keys(source);
    for (var i = 0 ; i < paths.length ; i++) {
        if (destination[paths[i]] == null)
            destination[paths[i]] = source[paths[i]];
        else
            _populateLinks(source[paths[i]], destination[paths[i]]);
    }
};

newsworthy.urls.get = function (host, response) {
    var db = newsworthy.urls.db;
    var trans = db.transaction(["urls"], "readwrite");
    var store = trans.objectStore("urls");

    var request = store.openCursor(host);

    request.onsuccess = function (e) {
        var result = e.target.result;
        if (!!result == false)
            response(null);

        response(result.value);
    }

    request.onerror = newsworthy.urls.onerror;
};