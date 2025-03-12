// header@0.1.1 downloaded from https://ga.jspm.io/npm:header@0.1.1/index.js

var e="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var t={};function Header(t){(this||e)._value=t}Header.prototype._value=void 0;Header.prototype.getKey=function(){throw new Error("Headers must implement #getKey()")};Header.prototype.getValue=function(){return(this||e)._value};Header.prototype.setValue=function(t){(this||e)._value=t};t=Header;var o=t;export default o;

