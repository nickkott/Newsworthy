var main = 	chrome.contextMenus.create({
				"title": 	"Newsworthy",
				"contexts": ["selection"],
				"onclick": encryptText
});

function encryptText(info, tab) {
    if (!Authentication.Verfied) {
        GetLogin();
    }
    //CreateGroup("Test");
    var txt = info.selectionText;
    Encrypt(1,txt);
}

/*** Authentication_Start ***/
    var Authentication = {
        Id: null,
        Pass: null,
        Verified: false
    };

    function GetLogin() {
        Authentication.Id = "ttokkcin@gmail.com";
        Authentication.Pass = "herpderpberp";
    }

    function Login() {
        $.ajax({
            type: "POST",
            url: "http://localhost/Newsworthy/Login/",
            data: '{"Id": "' + Authentication.Id + '", "Pass": "' + Authentication.Pass + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (good) {
                LoginResult(good);
            },
            error: function (e) {
                LoginError(e);
            }
        });
    }

    function LoginResult(good) {
        if (!good) {
            Authentication.Id = null;
            Authentication.Pass = null;
            Authentication.Verified = false;
        }
        else {
            Authentication.Verified = true;
        }
    }

    function LoginError(e) {
	    alert("An error occurred whilst logging in.");
    }
/*** Authentication_End ***/

/*** Group_Start ***/
    function CreateGroup(gName) {
        $.ajax({
            type: "POST",
            url: "http://localhost/Whisper/Group/",
            data: '{"Name": "' + gName + '","Auth": {"Id": "' + Authentication.Id + '", "Pass": "' + Authentication.Pass + '"}}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (eText) {
                CreateGroupResult(eText);
            },
            error: function (e) {
                CreateGroupError(e);
            }
        });
    }

    function CreateGroupResult(eText) {
        if (eText) {
            alert("Group successfully created.");
        }
        else {
            CreateGroupError(eText);
        }
    }

    function CreateGroupError(e) {
        alert("An error occurred while creating the group.");
    }
/*** Group_End ***/

/*** Encryption_Start ***/
    function Encrypt(Group,text) {
        $.ajax({
            type: "POST",
            url: "http://localhost/Newsworthy/Encrypt/",
            data: '{"g": "' + Group.toString() + '","s": "' + text + '","Auth": {"Id": "' + Authentication.Id + '", "Pass": "' + Authentication.Pass + '"}}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (eText) {
                EncryptResult(eText);
            },
            error: function (e) {
                EncryptError(e);
            }
        });
    }

    function EncryptResult(eText) {
        alert("Encrypted text: " + eText);
    }

    function EncryptError(e) {
        alert("An error occurred whilst encrypting.");
    }
/*** Encryption_End ***/