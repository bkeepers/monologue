// LICENSE : MIT
"use strict";
var assert = require("power-assert");
var injectBrowser = require('testium/mocha');
var pageObjects = require("./app-page-object");
describe("app-test", function () {
    before(injectBrowser());
    var browser;
    beforeEach(function () {
        browser = this.browser;
        browser.navigateTo("/");
    });
    describe("Feature Succesfully posting a status", function () {
        context("when fill in Status and post", function () {
            var text = "text";
            beforeEach(function () {
                var textarea = browser.getElement(pageObjects.textarea);
                textarea.type(text);
                var button = browser.getElement(pageObjects.postButton);
                button.click();
            });
            it("should see success", function () {
                var statusList = browser.getElement(pageObjects.statusList);
                var result = statusList.get("text");
                assert.equal(result, text);
            });
        });
    });
});