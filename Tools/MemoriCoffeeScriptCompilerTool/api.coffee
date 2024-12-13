"use strict";

class GameObject {
    constructor(setupFunc, updateFunc, terminateFunc) {
        this.Setup = setupFunc;
        this.Update = updateFunc;
        this.Terminate = terminateFunc;
    }
    static Start() {
        this.Setup();
        this.Update();
        this.Terminate();
        this = null;
    }
}

let instance1 = new GameObject(function() {}, function() {}, function() {});