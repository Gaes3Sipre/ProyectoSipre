    var pageLoadScripts = [
    ]

    var pageLoadCSS = [
    ]
    var pageRequiredFeatures = [
        "prettyPrint"
    ]

    var clipboard;

    var doneScriptsLoad = function () {
        clipboard = new Clipboard('[data-copycode="true"]', {
            target: function (trigger) {
                return trigger.parentNode.parentNode.getElementsByTagName("pre")[0];
            }
        });

        clipboard.on('success', function (e) {
            $.toasts("add", {
                msg: "Copied!",
            });
            e.clearSelection();
        });
    } // END: doneScriptsLoad();
    var pageDestroy = function () {
        clipboard.destroy();
        clipboard = void 0;
    };