var port = browser.runtime.connectNative("shutdown");

browser.browserAction.onClicked.addListener(() => {
  port.postMessage("kill");
});
