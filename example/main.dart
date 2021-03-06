import 'dart:html';
import 'package:platform_detect/src/navigator.dart';
import 'package:platform_detect/src/browser.dart';
import 'package:platform_detect/src/operating_system.dart';
import 'package:platform_detect/platform_detect.dart';

main() {
  _parseCurrentBrowser();
  ButtonElement evaluate = querySelector('#evaluate-test');
  evaluate.onClick.listen((_) => _parseTestValues());
}

void _parseCurrentBrowser() {
  document.querySelector('#current-browser').text = browser.name;
  document.querySelector('#current-vendor').text = window.navigator.vendor;
  document.querySelector('#current-appVersion').text =
      window.navigator.appVersion;
  document.querySelector('#current-appName').text = window.navigator.appName;
  document.querySelector('#current-userAgent').text =
      window.navigator.userAgent;

  CheckboxInputElement isChrome = document.querySelector('#current-is-chrome');
  isChrome.checked = browser.isChrome;

  CheckboxInputElement isFirefox =
      document.querySelector('#current-is-firefox');
  isFirefox.checked = browser.isFirefox;

  CheckboxInputElement isSafari = document.querySelector('#current-is-safari');
  isSafari.checked = browser.isSafari;

  CheckboxInputElement isInternetExplorer =
      document.querySelector('#current-is-ie');
  isInternetExplorer.checked = browser.isInternetExplorer;

  document.querySelector('#current-version').text = browser.version.toString();

  document.querySelector('#current-os').text = operatingSystem.name;
}

void _parseTestValues() {
  InputElement testVendor = querySelector('#test-vendor');
  InputElement testAppVersion = querySelector('#test-appVersion');
  InputElement testAppName = querySelector('#test-appName');
  InputElement testUserAgent = querySelector('#test-userAgent');
  var navigator = new TestNavigator();
  navigator.vendor = testVendor.value.trim();
  navigator.appVersion = testAppVersion.value.trim();
  navigator.appName = testAppName.value.trim();
  navigator.userAgent = testUserAgent.value.trim();
  Browser.navigator = navigator;
  OperatingSystem.navigator = navigator;

  querySelector('#test-browser-name').text = browser.name;
  querySelector('#test-browser-version').text = browser.version.toString();
  querySelector('#test-os-name').text = operatingSystem.name;
}
