//indexedDB.deleteDatabase("urls");
newsworthy.urls.open();
chrome.runtime.onMessage.addListener(
    function (request, sender, sendResponse) {
        if (request.type == "contentCheck") {
            newsworthy.urls.get(request.host, function (result) {
                sendResponse(result != null);
            });
            return true;
        }
        if (request.type == "populate") {
            var keys = Object.keys(request.hosts);
            for (var i = 0 ; i < keys.length ; i++)
                newsworthy.urls.add(keys[i], request.hosts[keys[i]]);
        }
    }
);