var request = require('request');
var getJsonFromJsonP = function (url, callback) {
request(url, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var jsonpData = body;
    var json;
    //if you don't know for sure that you are getting jsonp, then i'd do something like this
    try
    {
       json = JSON.parse(jsonpData);
    }
    catch(e)
    {
        var startPos = jsonpData.indexOf('({');
        var endPos = jsonpData.indexOf('})');
        var jsonString = jsonpData.substring(startPos+1, endPos+1);
	callback(null, jsonString);
    }
//    callback(null, json);
  } else {
//    callback(error);
  }
})
}
getJsonFromJsonP(process.argv[2], function(err, data) {
 eval("o = " + data);
 console.log(JSON.stringify(o,null,4));
});
