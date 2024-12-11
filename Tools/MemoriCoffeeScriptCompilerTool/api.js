"use strict";

class Debug {}

let Init = function() {}
let Update = function() {}
let Terminate = function() {}

let UniversalStart = function() {
    Init();
    Update();
    Terminate();
}