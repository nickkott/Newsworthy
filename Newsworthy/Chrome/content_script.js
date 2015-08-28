var host = document.location.href.split("://")[1]
                                 .split("/")[0]
                                 .replace("www.", "")
                                 .replace("m.", "");
var request = {
    "type": "contentCheck",
    "host": host
};
chrome.runtime.sendMessage(request, function (isNews) {
    console.log(isNews);
    if (isNews) {
        var links = document.getElementsByTagName("a"),
           hosts = {},
           path = [];
        for (var i = 0 ; i < links.length ; i++) {
            if (links[i].href.indexOf("://") < 0)
                continue;
            path = links[i].href.split("://")[1].split("/");
            path[0] = path[0].replace("www.", "").replace("m.", "");
            for (var j = 0, currObj = hosts ; j < path.length ; j++) {
                if (j == path.length - 1)
                    currObj[path[j]] = true;
                else if (currObj[path[j]] == null)
                    currObj = currObj[path[j]] = {};
                else
                    currObj = currObj[path[j]];
            }
        }
        request = {
            "type": "populate",
            "hosts": hosts
        }
        chrome.runtime.sendMessage(request, function (response) {
            console.log(response);
        });
    }
});