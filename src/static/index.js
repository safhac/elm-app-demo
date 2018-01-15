
// inject bundled Elm app into div#main
var Elm = require('../elm/Main');
// for (e in  process.env) {
//     console.log("env " + (e|"") );
// }
// console.log("terget " + process.env.NODE_ENV);
Elm.Main.embed(document.getElementById('body'));
